<?php //Este archivo  es para  actualizar  los productos.
session_start();

// Verificamos que haya sesión activa
if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}

// Verificamos que el rol sea Administrador, los consultores no pueden editar productos
if ($_SESSION['rol'] !== 'Administrador') {
    die("No tenés permisos para realizar esta acción.");
}

include "conexion.php";// aqui estamos  conectandonos a la base de datos principal 
//recibimos los datos con el metodo post de editar productos,
$id = $_POST['id'];// estamos conectanndo lo datos que nos va dar el cliente que nos va a llegar con el metod POST
$nombre = $_POST['nombre']; //nuevo nombre ingresado por el ususario
$precio = $_POST['precio']; //nuevo precio
$stock = $_POST['stock']; // nuevo stock
$categoriaID = isset($_POST['categoriaID']) && $_POST['categoriaID'] !== '' ? $_POST['categoriaID'] : null;// nueva categoria, si no se eligió queda en null
$usuario = $_SESSION['usuario']; // tomamos el nombre del usuario logueado

$query = "UPDATE productos SET Nombre = ?, Precio = ?, stock = ?, CategoriaID = ?, UsuarioModificacion = ? WHERE Id = ?";// ejecutamos una sentencia sql la cual se va actualizar con UPDATE  cada dato interesado. ? los signos de interrogacion son parametro que se van a sustituir con los parametros de la variable $params
$params = array($nombre, $precio, $stock, $categoriaID, $usuario, $id);//luego creamos  una variable $params  la cual dentro de ella esta un array con las diferentes 

try {
    $stmt = $conexion->prepare($query); // preparamos la consulta
    $stmt->execute($params); // ejecutamos pasando los parametros

    // Registramos la operación en la tabla de auditoría
    $queryAuditoria = "INSERT INTO AuditoriaProductos (ProductoID, NombreProducto, Operacion, Usuario, Detalles) VALUES (?, ?, ?, ?, ?)";
    $stmtAuditoria = $conexion->prepare($queryAuditoria);
    $stmtAuditoria->execute(array($id, $nombre, 'UPDATE', $usuario, 'Producto editado'));

    // si llegamos hasta aquí sin excepción, se actualizó correctamente
    header("Location: productos.php");
    exit();
} catch (PDOException $e) {
    die("Error al actualizar: " . $e->getMessage());
}
?>
