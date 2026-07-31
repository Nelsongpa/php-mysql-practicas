<?php
session_start();

// Si no hay sesión activa, redirigimos al login
if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}

include "conexion.php";

// Traemos todas las categorías para el desplegable del formulario de búsqueda
$queryCategorias = "SELECT * FROM categoria";
$stmtCategorias = $conexion->query($queryCategorias);
$categorias = $stmtCategorias->fetchAll(PDO::FETCH_ASSOC);

// Verificamos si el usuario envió el formulario de búsqueda
// Lista de columnas permitidas para ordenar (evita inyección SQL)
$columnasPermitidas = array('Id', 'Nombre', 'Precio', 'stock', 'fecha_creacion');
$orden = isset($_GET['orden']) && in_array($_GET['orden'], $columnasPermitidas) ? $_GET['orden'] : 'Id';

// Verificamos si el usuario envió el formulario de búsqueda
if ($_SERVER['REQUEST_METHOD'] === 'POST')  {
    // Si buscó, usamos el procedimiento almacenado con los filtros
    $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : '';
    $precioMin = isset($_POST['precioMin']) && $_POST['precioMin'] !== '' ? $_POST['precioMin'] : 0;
    $precioMax = isset($_POST['precioMax']) && $_POST['precioMax'] !== '' ? $_POST['precioMax'] : 999999;
    $categoriaID = isset($_POST['categoriaID']) && $_POST['categoriaID'] !== '' ? $_POST['categoriaID'] : null;

    $query = "EXEC sp_BuscarProductos ?, ?, ?, ?";
    $stmt = $conexion->prepare($query);
    $stmt->execute(array($nombre, $precioMin, $precioMax, $categoriaID));
} else {
    // Si no buscó, mostramos todos los productos, ordenados por la columna elegida
    $query = "SELECT * FROM vw_ProductosConCategoria ORDER BY $orden";
    $stmt = $conexion->query($query);
}

// Traemos todas las filas de resultado en un array
$productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de productos</title>
    <link rel="stylesheet" href="productos.css">
</head>
<body>

    <!-- Info del usuario logueado y botón de logout, arriba a la derecha -->
    <div style="text-align: right;">
        Usuario: <?php echo $_SESSION['usuario']; ?> (<?php echo $_SESSION['rol']; ?>)
        | <a href="logout.php">Cerrar sesión</a>
    </div>

    <h1>Productos</h1>
    <br>

    <!-- Formulario para agregar producto -->
    <?php if ($_SESSION['rol'] === 'Administrador') { ?>
    <!-- Formulario para agregar producto -->
    <form action="crear_productos.php" method="POST">
        <label for="nombre">Nombre de producto</label>
        <input type="text" id="nombre" name="nombre">
        <br><br>
        <label for="precio">Precio</label>
        <input type="number" id="precio" name="precio">
        <br><br>
        <label for="stock">Stock</label>
        <input type="number" id="stock" name="stock">
        <br><br>
        <label for="categoriaID">Categoría</label>
        <select name="categoriaID" id="categoriaID">
            <option value="">Sin categoría</option>
            <?php foreach ($categorias as $cat) { ?>
                <option value="<?php echo $cat['CategoriaID']; ?>"><?php echo $cat['Nombre']; ?></option>
            <?php } ?>
        </select>
        <br><br>
        <button type="submit">Guardar producto</button>
    </form>
<?php } ?>

    <h2>Buscar productos</h2>
    <br>

    <!-- Formulario de búsqueda -->
    <form action="productos.php" method="POST">
        <label>Nombre</label>
        <input type="text" name="nombre" value="<?php echo isset($_POST['nombre']) ? $_POST['nombre'] : ''; ?>">
        <br><br>
        <label>Precio mínimo</label>
        <input type="number" name="precioMin" value="<?php echo isset($_POST['precioMin']) ? $_POST['precioMin'] : ''; ?>">
        <br><br>
        <label>Precio máximo</label>
        <input type="number" name="precioMax" value="<?php echo isset($_POST['precioMax']) ? $_POST['precioMax'] : ''; ?>">
        <br><br>

        <label>Categoría</label>
        <select name="categoriaID">
            <option value="">Todas</option>
            <?php foreach ($categorias as $cat) {
                $seleccionado = (isset($_POST['categoriaID']) && $_POST['categoriaID'] == $cat['CategoriaID']) ? 'selected' : '';
                echo "<option value='" . $cat['CategoriaID'] . "' $seleccionado>" . $cat['Nombre'] . "</option>";
            } ?>
        </select>
        <br><br>

        <button type="submit">Buscar</button>
    </form>

    <h2>Lista de productos</h2>
    <br><br>

    <table>
        <tr>
    <th><a href="productos.php?orden=Id">ID</a></th>
    <th><a href="productos.php?orden=Nombre">Nombre</a></th>
    <th><a href="productos.php?orden=Precio">Precio</a></th>
    <th><a href="productos.php?orden=stock">Stock</a></th>
    <th><a href="productos.php?orden=fecha_creacion">Fecha de creación</a></th>
    <th>Categoría</th>
    <th>Acciones</th>
     </tr>
        <?php
        if (count($productos) === 0) {
            echo "<tr><td colspan='7'>No se encontraron productos que coincidan con los filtros seleccionados.</td></tr>";
        } else {
            foreach ($productos as $fila) {
                echo "<tr>
                    <td>" . $fila['Id'] . "</td>
                    <td>" . $fila['Nombre'] . "</td>
                    <td>" . $fila['Precio'] . "</td>
                   <td" . ($fila['stock'] < 5 ? " style='background-color: #ffcccc; font-weight: bold;'" : "") . ">" . $fila['stock'] . "</td>
                    <td>" . date('d/m/Y H:i', strtotime($fila['fecha_creacion'])) . "</td>
                    <td>" . $fila['NombreCategoria'] . "</td>
                    <td>" . ($_SESSION['rol'] === 'Administrador' ? "
    <a href='editar_producto.php?id=" . $fila['Id'] . "'>Editar</a> /
    <a href='eliminar_producto.php?id=" . $fila['Id'] . "' onclick='return confirm(\"¿Estás seguro?\")'>Eliminar</a>
" : "") . "</td>
                </tr>";
            }
        }
        ?>
    </table>
</body>
</html>
