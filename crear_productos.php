<?php
session_start();

// Verificamos que haya sesión activa
if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}

// Verificamos que el rol sea Administrador, los consultores no pueden crear productos
if ($_SESSION['rol'] !== 'Administrador') {
    die("No tenés permisos para realizar esta acción.");
}

include "conexion.php";// conacetamos  con la base de datos.

$nombre = $_POST['nombre']; //tomamos lo datos del formulario con el metodo post 
$precio = $_POST['precio'];// tomamos  precio
$stock = $_POST['stock'];// tomamos el stock
$categoriaID = isset($_POST['categoriaID']) && $_POST['categoriaID'] !== '' ? $_POST['categoriaID'] : null;// tomamos la categoria, si no se eligió queda en null
$usuario = $_SESSION['usuario']; // tomamos el nombre del usuario logueado

$query = "INSERT INTO productos (Nombre, Precio, stock, CategoriaID, UsuarioCreacion, UsuarioModificacion) VALUES (?, ?, ?, ?, ?, ?)";// esta es la sentencia  sql
$params = array($nombre, $precio, $stock, $categoriaID, $usuario, $usuario);// los datos que se van a suplantar por los simbolos ?.

try {
    $stmt = $conexion->prepare($query); // preparamos la consulta
    $stmt->execute($params); // ejecutamos pasando los parametros

    // Obtenemos el Id del producto recién insertado, lo necesitamos para la auditoría
    $idNuevoProducto = $conexion->lastInsertId();

    // Registramos la operación en la tabla de auditoría
    $queryAuditoria = "INSERT INTO AuditoriaProductos (ProductoID, NombreProducto, Operacion, Usuario, Detalles) VALUES (?, ?, ?, ?, ?)";
    $stmtAuditoria = $conexion->prepare($queryAuditoria);
    $stmtAuditoria->execute(array($idNuevoProducto, $nombre, 'INSERT', $usuario, 'Producto creado'));

    // si llegamos hasta aquí sin excepción, se insertó correctamente
    header("Location: productos.php");
    exit();
} catch (PDOException $e) {
    die("Error al guardar: " . $e->getMessage());
}
?>