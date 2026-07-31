<?php

try {
    $pdo = new PDO("mysql:host=localhost;dbname=alumnos", "root", "");// Aqui  hacemos la conexion con la base de datos colocando ubicacion e nombre de base de datos ususario y contraceña.
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // aqui con setAtrribute lo que hace es que lance un error en dado caso  algo salga mal 
} catch (PDOException $e) {// aqui el catch atrapa el herror y no los muestra php genera la variable $e y guardad en ella el error lo muestra.
    die(json_encode(["error" => "Conexión fallida: " . $e->getMessage()]));
}
?>
