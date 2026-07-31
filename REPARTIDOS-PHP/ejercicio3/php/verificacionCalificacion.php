<?php
/*  hola en esta  instacia  conectamos a la base de datos con incluide , inyectamos el dato cedula con metodo POST 
luego mediante try hacemos una sentencia sql   la cual seleccionamos la tabla calificacion  de la tabala alumno 
inyectando la cedula agregada , luego la variable $stmt con el metodo (prepare) prepara la sentencia para ejecutar 
con execute ejecuta  la sentencia luego con el if ejecutamos si la alificacion es menor  a 8 no muestra un msj por
Json donde (Reprueba), si no se cumpre el else muestra un msj aprobado() y si no catch toma el error lo guarda en 
la variable e que es una variable de php y no las muestra con el metodo get,*/
    include 'conexion.php';
    $cedula = $_POST['cedula'];
try{
    $sql= "SELECT CALIFICACION FROM ALUMNO WHERE CEDULA=:cedula";
    $stmt= $pdo -> prepare($sql); 
    $stmt -> execute([':cedula' => $cedula,]);
    $alumno = $stmt -> fetch(PDO::FETCH_ASSOC); 

    if($alumno['CALIFICACION'] < 8 ) { echo json_encode(["resultado" => "Reprueba"]);
    }else{ echo json_encode(["resultado" => "Aprobado"]);}

}catch(PDOException $e){ echo json_encode(["error" => $e->getMessage()]);
}
?>