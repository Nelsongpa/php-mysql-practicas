<?php
    /* levantamos la conexion con el include y recibimos por request post la cedula.
    intentamos mediante try realizar un select a los alumnos inyectando cedula en consulta y cargamos sus inasistencias
    si las inasistencais son mayores a 20 devolvemos json con reprueba por inasistencias
    sino devuelvo que no pierde por inasistencias
    cualquier error lo atrapamos en catch.*/

    
    include 'conexion.php';
    $cedula = $_POST['cedula'];

    try {
        $sql= "SELECT INASISTENCIA FROM ALUMNO WHERE CEDULA = :cedula ";
        $stmt = $pdo->prepare($sql);
        $stmt -> execute([':cedula' => $cedula,]);
        $alumno = $stmt->fetch(PDO::FETCH_ASSOC);

        if($alumno['INASISTENCIA'] >= 20) echo json_encode(["resultado" => "Reprueba por inasistencias"]);
        else echo json_encode(["resultado" => "No pierde por inasistencias"]);
    }catch (PDOException $e) echo json_encode(["error" => $e->getMessage()]);