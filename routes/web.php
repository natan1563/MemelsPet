<?php

use App\Http\Controllers\CsvController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});

Route::prefix('relatorio')->group(function () {
    Route::get('cliente', [CsvController::class, 'getRelatorioCliente']);
    Route::post('cliente', [CsvController::class, 'setClientes']);

    Route::get('animal', [CsvController::class,  'getRelatorioAnimal']);
    Route::post('animal', [CsvController::class,  'setAnimais']);
});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
