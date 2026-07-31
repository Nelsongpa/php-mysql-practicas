<?php 
    require_once __DIR__ . "/../config/db.php";
    require_once __DIR__ . "/../classes/LogicaProducto.php";

    $nombreProducto = $_POST["nombre"] ?? '';
    $cantidadProducto = $_POST["cantidad"] ?? '';

    
    $addP = new ProductoRepository($pdo);
    
    if($addP->agregarProducto($nombreProducto,$cantidadProducto))
    {
        http_response_code(201);
        echo json_encode(['success' => "Todo bien"]);
    }else 
    {
        http_response_code(400);
        echo json_encode(['error' => 'Algo salió mal']);
    }