<?php 
    try
    {
        $pdo = new PDO(
            'mysql:host=db;dbname=stock;charset=utf8mb4','root', 'root123',      
            [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]
        );
    }
    catch (PDOException $e)
    {
        http_response_code(500);
        echo json_encode(['error' => "$e->getMessage()"]);
        exit;
    }