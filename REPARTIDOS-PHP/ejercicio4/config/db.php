<?php 
/*Esta el la conexion con la base de dato la cual se crea un objeta que nos permite es conexion usamos try y catch para 
detectar el error agregamos donde va estar alojado  nombre de la BD ,usuario y root , en el catch nos se atrapa si hay un
error nos muestra un error 500 si el erro es por parte del servidor con el formato Json */
    try
    {
        $pdo = new PDO(
            'mysql:host=localhost;dbname=pelicula;charset=utf8mb4','root', '',      
            [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]
        );
    }
    catch (PDOException $e)
    {
        http_response_code(500);
        echo json_encode(['error' => "{$e->getMessage()}"]);
        exit;
    } 
?>