<?php
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

include "conexion.php"; // conexion  con base de datos 

$id = $_GET['id'];// tomamos el dato del id   por metodo get que no los da por la url

$query = "SELECT * FROM productos WHERE Id = ?";// senetncia sql 
$stmt = $conexion->prepare($query); // preparamos la consulta
$stmt->execute(array($id)); // ejecutamos pasando el id como parametro
// fetch() trae solo una fila (a diferencia de fetchAll que trae todas)
// PDO::FETCH_ASSOC nos permite acceder a los datos por nombre de columna
// Ejemplo: $producto['Nombre'], $producto['Precio']
$producto = $stmt->fetch(PDO::FETCH_ASSOC);

// Traemos todas las categorías para armar el desplegable
$stmtCategorias = $conexion->query("SELECT * FROM categoria");
$categorias = $stmtCategorias->fetchAll(PDO::FETCH_ASSOC);
?>
<!-- esto es la parte html  lo cual agregamos un formulario. -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="productos.css">
</head>
<body>
    <h1>Editar Producto</h1>
    <form action="actualizar_producto.php" method="POST">
        <input type="hidden" name="id" value="<?php echo $producto['Id']; ?>">
        
        <label>Nombre</label>
        <input type="text" name="nombre" value="<?php echo $producto['Nombre']; ?>">
        
        <br><br>
        
        <label>Precio</label>
        <input type="number" name="precio" value="<?php echo $producto['Precio']; ?>">
        
        <br><br>
        
        <label>Stock</label>
        <input type="number" name="stock" value="<?php echo $producto['stock']; ?>">
        
        <br><br>

        <label>Categoría</label>
        <select name="categoriaID">
            <option value="">Sin categoría</option>
            <?php foreach ($categorias as $cat) {
                // selected si esta categoría es la que ya tiene el producto
                $seleccionado = ($producto['CategoriaID'] == $cat['CategoriaID']) ? 'selected' : '';
                echo "<option value='" . $cat['CategoriaID'] . "' $seleccionado>" . $cat['Nombre'] . "</option>";
            } ?>
        </select>

        <br><br>
        
        <button type="submit">Guardar cambios</button>
        <a href="productos.php">Cancelar</a>
    </form>
</body>
</html>