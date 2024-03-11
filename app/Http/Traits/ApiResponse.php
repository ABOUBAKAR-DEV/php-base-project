<?php


use Illuminate\Http\Response;

trait ApiResponse {

    public function apiResponse(int $status, string $message, string $code, array $data = [], string $error = null)
    {
        // Exemple de retour d'une réponse JSON avec un code de réponse
        return response()->json([
            'message' => $message,
            'error' => $error,
            'code' => $code,
            'data' =>$data
        ], $status);
    }
}
