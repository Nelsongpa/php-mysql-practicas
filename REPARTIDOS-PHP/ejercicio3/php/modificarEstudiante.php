<?php
include 'conexion.php'; // conectamos  a la hoja que nos conecta a la base e datos.

$cedula = $_POST['cedula'];// aqui recibnimos los datos con el metodo post
$inasistencia = $_POST['inasistencia'];//aqui recibimos con el motod post
$calificacion = $_POST['calificacion'];

if (!is_numeric($inasistencia) || $inasistencia < 0) {// aqui aplicamos la logica para modificar la inasistencias debe ser un entero positivo 
    die(json_encode(["error" => "Inasistencia debe ser un entero positivo"])); //

    }
if(!is_numeric($calificacion) || $calificacion < 1 || $calificacion > 10 ){
    die(json_encode(["error" =>" la clasificacion debe ser del 1 a 10"]));
}
try{ // Sentecia sql
    $sql= "UPDATE alumno
    SET CALIFICACION = :calificacion , INASISTENCIA =:inasistencia
    WHERE CEDULA = :cedula";

$stmt = $pdo->prepare($sql);  // prepara la centencia sql 

$stmt->execute([//"ejecutamos la consulta reemplazando los marcadores :cedula, :nombre... con los valores reales"
    ':cedula'      => $cedula,
    ':inasistencia'=> $inasistencia,
    ':calificacion'=> $calificacion
]);
echo json_encode(["mensaje" => "Alumno agregado modificado"]);// si todo sale bien  nos muestra mediante un msj json  alumno agregado

}catch(PDOException $e){//  PDOExceoption guarda  en la variable e el error .
    echo json_encode(["error" => $e->getMessage()]); // nos muestra el tipo del error  en formato json
}


?>