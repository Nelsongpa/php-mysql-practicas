<?php
include 'conexion.php';// aqui hacemos la conexion directa con el incluid a la conexion de base de datos que esta en el archiovo conexion.

$cedula = $_POST['cedula'];// DE ESTA FORMA RECIBIMOS LO QUE NOS ENVIEN  DESDE EL CAMPO cedula  el metodo que usamos es el post siempre se escribe en minuscula com buena practica
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$inasistencia = $_POST['inasistencia'];
$calificacion = $_POST['calificacion'];
try {//aqui le estamos diciendo la forma que deb insertar los datos
$sql = "INSERT INTO ALUMNO (CEDULA, NOMBRE, APELLIDO, INASISTENCIA, CALIFICACION) 
        VALUES (:cedula, :nombre, :apellido, :inasistencia, :calificacion)"; //como un tipo de plantilla

$stmt = $pdo->prepare($sql); //"preparamos la consulta SQL para ejecutarla de forma segura, el resultado se guarda en $stmt"

$stmt->execute([//"ejecutamos la consulta reemplazando los marcadores :cedula, :nombre... con los valores reales"
    ':cedula'      => $cedula,
    ':nombre'      => $nombre,
    ':apellido'    => $apellido,03

    ':inasistencia'=> $inasistencia,
    ':calificacion'=> $calificacion
]);
echo json_encode(["mensaje" => "Alumno agregado correctamente"]);// Aqui si todo esta nbien muestra una msj en un formate json donde nos notifica que el ususarrion se agrego

 }catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);//aqui hay un error  no muestra este msj.
}

?>