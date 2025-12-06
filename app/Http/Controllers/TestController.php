<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestController extends Controller
{
    public function testDatabase()
    {
        try {
            $connection = DB::connection();
            $pdo = $connection->getPdo();
            $databaseName = $connection->getDatabaseName();
            
            return response()->json([
                'status' => 'success',
                'message' => 'Database connection successful!',
                'database' => $databaseName,
                'driver' => $connection->getDriverName()
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Database connection failed: ' . $e->getMessage()
            ], 500);
        }
    }
}
