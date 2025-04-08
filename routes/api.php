<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;

Route::get('/users', function () {
    return User::all();
});

Route::post('/login', [LoginController::class, 'login']);