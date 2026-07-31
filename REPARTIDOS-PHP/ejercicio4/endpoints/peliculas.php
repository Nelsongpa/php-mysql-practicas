<?php
/*bueno este insertamos los archivos con require_once creamos una objeto que vamos a usar y hicimos un switch 
 desarrollar la api rest el $_SERVER  es un metodo de php que es un aaray y nos permite es gtener un archivo 
 que puedan estar los 4 verbos adentro , luego dentro del switch tenemos loss cuatro verbos  por case */
header("Content-Type: application/json");

require_once __DIR__ . "/../config/db.php";
require_once __DIR__ . "/../classes/BaseRepository.php";
require_once __DIR__ . "/../classes/PeliculaRepository.php";

$repo = new PeliculaRepository($pdo);

$metodo = $_SERVER['REQUEST_METHOD'];

switch ($metodo) {
    case 'GET': 
        $genero = $_GET['genero'] ?? null;
        $peliculas = $repo->listar($genero);
    http_response_code(200);
    echo json_encode(['success' => $peliculas]);
    
        break;

case 'POST':
    $datos = json_decode(file_get_contents("php://input"), true);

    $titulo = $datos['titulo'] ?? '';
    $genero = $datos['genero'] ?? '';
    $anio   = $datos['anio'] ?? '';

    if ($titulo === "" || $genero === "" || $anio === "") {
        http_response_code(400);
        echo json_encode(['error' => 'Todos los campos son obligatorios']);
        break;
    }

    if ($repo->agregar($titulo, $genero, (int)$anio)) {
        http_response_code(200);
        echo json_encode(['success' => 'Película agregada']);
    } else {
        http_response_code(400);
        echo json_encode(['error' => 'No se pudo agregar la película']);
    }
    break;

        case 'PUT':
    $id = $_GET['id'] ?? null;

    if ($id === null) {
        http_response_code(400);
        echo json_encode(['error' => 'Falta el id']);
        break;
    }

    $datos = json_decode(file_get_contents("php://input"), true);

    $titulo = $datos['titulo'] ?? '';
    $genero = $datos['genero'] ?? '';
    $anio   = $datos['anio'] ?? '';

    if ($titulo === "" || $genero === "" || $anio === "") {
        http_response_code(400);
        echo json_encode(['error' => 'Todos los campos son obligatorios']);
        break;
    }
     if ($repo->actualizar((int) $id, $titulo, $genero, (int) $anio)) {
        http_response_code(200);
        echo json_encode(['success' => 'Película actualizada']);
    } else {
        http_response_code(400);
        echo json_encode(['error' => 'No se pudo actualizar la película']);
    }
    break;
        


    case 'DELETE':
    
    $id = $_GET['id'] ?? null;

    if ($id === null) {
        http_response_code(400);
        echo json_encode(['error' => 'Falta el id']);
        break;
    }

    if ($repo->eliminar((int)$id)) {
        http_response_code(200);
        echo json_encode(['success' => 'Película eliminada']);
    } else {
        http_response_code(400);
        echo json_encode(['error' => 'No se pudo eliminar la película']);
    }
    break;
        

}
