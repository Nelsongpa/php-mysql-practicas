<?php 
    require_once __DIR__ . "/../config/db.php";
    require_once __DIR__ . "/../classes/LogicaProducto.php";
    
    $listarP = new ProductoRepository($pdo);
    
    if($listarP->listar())
    {
        http_response_code(201);
        echo json_encode(['success' => $listarP->listar()]);
    }else 
    {
        http_response_code(400);
        echo json_encode(['error' => 'Algo salió mal']);
    }