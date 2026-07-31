<?php 
    require_once __DIR__ . "/../config/db.php";
    require_once __DIR__ . "/../classes/LogicaProducto.php";

    $idProducto = $_POST["id"] ?? '';
    
    $idP = new ProductoRepository($pdo);
    
    if($idP->eliminarProducto($idProducto))
    {
        http_response_code(201);
        echo json_encode(['success' => "Todo bien"]);
    }else 
    {
        http_response_code(400);
        echo json_encode(['error' => 'Algo salió mal']);
    }