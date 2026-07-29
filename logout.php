<?php
// Iniciamos sesión para poder acceder a ella y destruirla
session_start();

// session_unset() borra todas las variables guardadas en la sesión
session_unset();

// session_destroy() termina la sesión por completo
session_destroy();

// Redirigimos al login
header("Location: login.php");
exit();
?>