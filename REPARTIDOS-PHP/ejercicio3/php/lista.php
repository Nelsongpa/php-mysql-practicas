<?php
include 'conexion.php';// aqui conectamos a la base de datos,

try { // aqui usamos try
    $sql= "SELECT * FROM ALUMNO "; //seleccionamos toda la base de datos.

    $stmt = $pdo -> prepare($sql);// aqui prepara y  envias la sentencia de sql y al mismo tiempo lo enviamos de manera separada de manera de seguridad para eviar inyeccion de codigo malisisos.

    $stmt -> execute();// esta linia es la que ejecuta  la sentecia SQL , puede tener una sentencia o no 
   

    $alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC); //Después de ejecutar la consulta, MySQL tiene los resultados listos. fetchAll los trae todos de una vez y los convierte en un array PHP.
echo json_encode($alumnos);// nos muesta en un formato Json / PDO::FETCH_ASSOC -> le dice como fromatar  como un array


} catch (PDOException $e) {// catch lo que es va hacer es que   que me va motra si hay un error con PDOException  lo guarda en la variable $e
     echo json_encode(["error" => $e->getMessage()]);// getMesssage trae el error el msje descritivo del error .
}
?>