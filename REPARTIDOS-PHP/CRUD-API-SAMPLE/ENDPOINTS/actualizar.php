<?php
    require_once __DIR__ . "/../config/db.php";
    require_once __DIR__ . "/../classes/LogicaProducto.php";

    $idProducto       = $_POST["id"]       ?? '';
    $nombreProducto   = $_POST["nombre"]   ?? '';
    $cantidadProducto = $_POST["cantidad"] ?? '';

    $repo = new ProductoRepository($pdo);

    if($repo->actualizarProducto((int)$idProducto, $nombreProducto, (int)$cantidadProducto))
    {
        http_response_code(200);
        echo json_encode(['success' => 'Producto actualizado']);
    }
    else
    {
        http_response_code(400);
        echo json_encode(['error' => 'Algo salió mal']);
    }
