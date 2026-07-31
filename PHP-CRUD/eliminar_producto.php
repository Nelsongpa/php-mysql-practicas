<?php
session_start();

// Verificamos que haya sesión activa
if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}

// Verificamos que el rol sea Administrador, los consultores no pueden eliminar productos
if ($_SESSION['rol'] !== 'Administrador') {
    die("No tenés permisos para realizar esta acción.");
}

include "conexion.php";//conexion con base de datos

$id = $_GET['id'];// tomamos el id mediante a url 
$usuario = $_SESSION['usuario']; // tomamos el nombre del usuario logueado

try {
    // Antes de eliminar, buscamos el nombre del producto para guardarlo en la auditoría
    $queryNombre = "SELECT Nombre FROM productos WHERE Id = ?";
    $stmtNombre = $conexion->prepare($queryNombre);
    $stmtNombre->execute(array($id));
    $producto = $stmtNombre->fetch(PDO::FETCH_ASSOC);
    $nombreProducto = $producto['Nombre'];

    // Ahora sí eliminamos el producto
    $query = "DELETE FROM productos WHERE Id = ?";// sentencia de sql
    $params = array($id);// el parametro que suplanta  id por ?
    $stmt = $conexion->prepare($query); // preparamos la consulta
    $stmt->execute($params); // ejecutamos pasando los parametros

    // Registramos la operación en la tabla de auditoría
    $queryAuditoria = "INSERT INTO AuditoriaProductos (ProductoID, NombreProducto, Operacion, Usuario, Detalles) VALUES (?, ?, ?, ?, ?)";
    $stmtAuditoria = $conexion->prepare($queryAuditoria);
    $stmtAuditoria->execute(array($id, $nombreProducto, 'DELETE', $usuario, 'Producto eliminado'));

    // si llegamos hasta aquí sin excepción, se eliminó correctamente
    header("Location: productos.php");
    exit();// termina de ejecutar el script.
} catch (PDOException $e) {
    die("Error al eliminar: " . $e->getMessage());// el error se muestra con getMessage
}
?>
