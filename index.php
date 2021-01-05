<?php
include 'vendor/autoload.php';

if (!function_exists('json')) {
	/**
	 * ZWrócenie odpowiedzi JSON.
	 *
	 * @param  array   $data Dane zwracane wraz z odpowiedzią
	 * @param  integer $code Kod odpowiedzi
	 * @return \App\JsonResponse
	 */
	function json(array $data, $code = 200): \App\JsonResponse
	{
		return (new \App\JsonResponse())
			->with($data)
		    ->code($code);
	}
}

new \App\Main();