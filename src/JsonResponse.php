<?php

namespace App;

use App\ResponseInterface;

use function http_response_code;
/**
 *
 */
class JsonResponse implements ResponseInterface
{
	/**
	 * Dane.
	 *
	 * @var array
	 */
	protected $_data = [];

	/**
	 * Dodanie danych.
	 *
	 * @param  array $data Dane
	 * @return self
	 */
	public function with(array $data): self
	{
		$this->_data = array_merge($this->_data, $data);
		return $this;
	}

	/**
	 * Ustawienie kodu odpowiedzi.
	 *
	 * @param  integer $code Kod
	 * @return void
	 */
	public function code(int $code = 200): self
	{
		$this->code = $code;
		return $this;
	}

	/**
	 * Pobranie kodu odpowiedzi.
	 *
	 * @return int
	 */
	public function getCode(): int
	{
		if (!isset($this->code)) {
			$this->code();
		}

		return $this->code;
	}

	/**
	 * Zwrócenie odpowiedzi w formacie JSON.
	 *
	 * @return void
	 */
	public function response(): void
	{
		http_response_code($this->getCode());
		header('Content-Type: application/json');
		echo json_encode($this->_data);
		exit();
	}
}
