<?php
// Iniciamos la sesión, esto permite guardar datos del usuario entre páginas
session_start();

include "conexion.php";

$error = "";

// Si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'];
    $contraseña = $_POST['contraseña'];

    // Buscamos un usuario que coincida con el nombre y la contraseña ingresados
    $query = "SELECT * FROM Usuarios WHERE NombreUsuario = ? AND Contraseña = ?";
    $stmt = $conexion->prepare($query);
    $stmt->execute(array($usuario, $contraseña));
    $usuarioEncontrado = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuarioEncontrado) {
        // Si las credenciales son correctas, guardamos los datos en la sesión
        $_SESSION['usuario'] = $usuarioEncontrado['NombreUsuario'];
        $_SESSION['rol'] = $usuarioEncontrado['Rol'];

        header("Location: productos.php");
        exit();
    } else {
        // Si no coincide, mostramos un mensaje genérico sin revelar más detalles
        $error = "Usuario o contraseña incorrectos.";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="productos.css">
</head>
<body>
    <h1>Iniciar sesión</h1>

    <?php if ($error !== "") { ?>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php } ?>

    <form action="login.php" method="POST">
        <label>Usuario</label>
        <input type="text" name="usuario">
        <br><br>
        <label>Contraseña</label>
        <input type="password" name="contraseña">
        <br><br>
        <button type="submit">Ingresar</button>
    </form>
</body>
</html>
