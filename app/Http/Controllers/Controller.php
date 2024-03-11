<?php

namespace App\Http\Controllers;

use ApiResponse;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Response;


class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests, ApiResponse;

}
