<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\MessageController;

Route::post('/login',[AuthController::class, 'login']);

Route::middleware(['auth:api'])->group(function () {
    Route::get('/check',[AuthController::class, 'check']);
    Route::get('/conversation/init',[ConversationController::class, 'init']);
    Route::post('/conversation/shutDown/{id}',[ConversationController::class, 'shutDown']);
    Route::get('/conversation/index',[ConversationController::class, 'index']);
    Route::post('/message',[MessageController::class, 'save']);
});
