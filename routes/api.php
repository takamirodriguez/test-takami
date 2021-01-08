<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\JWTAuthController;
use App\Http\Controllers\API\PasswordResetRequestController;
use App\Http\Controllers\API\ChangePasswordController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Non protected routes

Route::post('register', [UserController::class, 'store']);
Route::post('login', [UserController::class, 'login']);
Route::post('/reset-password-request', [PasswordResetRequestController::class, 'sendPasswordResetEmail']);
Route::post('/change-password', [ChangePasswordController::class, 'passwordResetProcess']);


Route::group(['middleware' => 'jwt.auth'], function () { //Protected routes by JWT
    //User and Auth routes
    Route::apiResource('user',UserController::class);
    Route::post('logout', [UserController::class, 'logout']);
    Route::post('getUser',[UserController::class, 'getUser']);


    //Product API routes
    Route::apiResource('products',ProductController::class);
    Route::post('products/{id}',[ProductController::class,'update']);
    Route::post('products-search',[ProductController::class,'search']);

});

