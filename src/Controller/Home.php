<?php

namespace App\Controller;

use App\View\View;
use App\Model\Film as FilmModel;
/**
 *
 */
class Home
{
	const PAGE_SIZE = 2;

	public function index()
	{
		
		$view = new View();

		$pageShouldBeZeroed = ($_GET['resetPage'] ?? false) === '1';

		if ($pageShouldBeZeroed) {
			$_POST['offset'] = 0;
		} else {
			// Wzór na przeliczenie strny, limitu i offsetu:
			// O = L * P
			// O - Offset - czyli film od którego zaczynamy pobierać kolejne filmy
			// L - Limit - Liczba filmów jakie zostaną pobrane (chyba że jesteśmy przy końcu i nie będzie już aż tylu - wtedy tylko tyle, ile zostało
			// P - Page - Numer strony na której obecnie jesteśmy
			// L = O / P
			// P = O / L
			$_POST['offset'] = self::PAGE_SIZE * ($_GET['page'] ?? 0);
		}

		$_POST['limit'] = self::PAGE_SIZE;

		$filmModel = new FilmModel();
		// Pobranie listy filmów zgodnie z zadanymi filtrami oraz ograniczeniami (limit, offset)
		$films = $filmModel->getAllWithRelations($_GET['filters'] ?? [], $_POST['limit'], $_POST['offset']);
		// Ustalenie całkowitej liczby strony dla obecnych filtrów (ile stron filmów przy obecnych filtrach jest)
		$numberOfPages = $filmModel->getNumberOfPages($_GET['filters'] ?? [], $_POST['limit']);


		return $view->template('baseTemplate')
			->with([
				'hello' => 'Witaj',
				'numberOfPages' => $numberOfPages, //to liczba przycisków paginatora np. jeśli w paginatorze jest 1, 2, 3, 4, 5 to ta zmienna wynosi 5
				'films' => $films,
				'limit' => $_POST['limit'], //to liczba filmów wyświetlanych na jednym widoku.
				'offset' => $_POST['offset'], //to liczba filmu od którego chcemy pobierać filmy z bazy danych, czyli jeśli pierwszy wiersz to titanic, drugi to dynastia, trzeci to terminator, to jeśli chcemy pobierać od terminatora łącznie z terminatorem, to offset wynosi 2. Offset to limit x page
				'page' => ($_POST['offset']) / ($_POST['limit']), //to obecna strona w kodzie, liczona jako offset / limit
				'pageUrlBase' => \App\Helper\Redirect::APP_URL.'index.php?controller=Home&action=index&page=',
				'pageUrlFilters' => $this->getUrlForFilters(),
				'filters' => $_GET['filters'] ?? [],
			]);
	
    }

	public function getUrlForFilters()
	{
		$url = '';

		if (!isset($_GET['filters'])) {
			return $url;
		}


		foreach ($_GET['filters'] as $filterName => $filterValue) {
			if (is_array($filterValue)) {
				foreach ($filterValue as $singleValue) {
					$url .= "&filters[$filterName][]=".$singleValue;
				}

			} else {
				$url .= '&filters['.$filterName.']='.$filterValue;
			}
		}

		return $url;
	}
}
