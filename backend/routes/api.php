<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\MeetingController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will

| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('/ping', function (Request $request) {
    return response()->json(['message' => true]);
});

Route::get('/get-goli-data', [MeetingController::class, 'getGoliData']);
Route::get('/get-goli-2-data', [MeetingController::class, 'getGoli2Data']);
Route::post('/store-meeting', [MeetingController::class, 'storeMeeting']);
// Route::post('/store-meeting-json', [MeetingController::class, 'storeMeetingJson']);
Route::get('/get-meetings', [MeetingController::class, 'getMeetings']);
Route::get('/get-group-company-meetings', [MeetingController::class, 'getGroupCompanyMeetings']);