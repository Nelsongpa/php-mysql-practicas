<?php
// Variables de configuración de la conexión a SQL Server con PDO
$servidor = "(local)";       // dónde está alojado el servidor
$baseDatos = "practico_1";   // nombre de la base de datos
$usuario = "admin_1";         // usuario de SQL Server
$contraseña = "admin123!";    // contraseña del usuario

try {
    // Creamos la conexión con PDO usando el driver sqlsrv
    $conexion = new PDO("sqlsrv:Server=$servidor;Database=$baseDatos", $usuario, $contraseña);
    
    // Hacemos que PDO lance excepciones cuando algo falla, en vez de fallar en silencio
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Si la conexión falla, mostramos el error y detenemos la ejecución
    die("Error de conexión: " . $e->getMessage());
}
?>