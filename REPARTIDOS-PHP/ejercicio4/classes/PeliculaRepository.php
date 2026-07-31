<?php
/*Aqui la class  PeliculaRepository hereda y recibe automatica mente la propiedad $pdo del contrutor BaseRepository, en listar decide 
que consulta armar segun si te pasaron el genero o no , si no te pasan el genero te muestra toda la lista de peliculas  con el prepare
(prepara la consulta pero no la ejecuta devuelve un objeto con el cual vamos aejecutar mas adelante con el execute , con el if y el else 
dependiendo si se le agrega un genero  ejecuta de sierta manera , el return trae lo que hay en $stmt en forma de un array Asociativo) */
class PeliculaRepository extends BaseRepository
{
    public function listar(?string $genero): array
    {
      if($genero === null){
        $sql = "SELECT * FROM peliculas";
      } else {
        $sql = "SELECT*FROM  peliculas Where GENERO =?";
      }
        $stmt = $this->pdo->prepare($sql);

    if ($genero === null) {
        $stmt -> execute();
        
    }else{
        $stmt -> execute([$genero]);
    }
    return $stmt ->fetchAll();

    }

   /*ok esta es la  parte de agregar igual que atras solo que agregar y no tiene dos condiones prepara la inyeccion de datos a la base de 
   datos  y ejecuta con excute */ 
    public function agregar(string $titulo, string $genero, int $anio):bool{
 try {
    $stmt = $this->pdo->prepare( "INSERT INTO peliculas (titulo,genero,anio) VALUES (:titulo, :genero,:anio)");

    $stmt ->execute([
    ':titulo' => $titulo,
    ':genero' => $genero,
    ':anio' => $anio
    ]);
     
    return true;

   } catch (PDOException $e) {return false;}
    }
    /*bueno aqui es un funcion publica la cual la usaremos para actualizar  colocamos  los parametros y ejecutamos con prepare 
    -> preparamos la consulta sql y con execute ejecutamos si todo los datos an sido agregado  no retorna un true*/
    public function actualizar(int $id, string $titulo, string $genero ,int $anio ):bool{
      try {
        $stmt = $this->pdo->prepare("UPDATE peliculas SET titulo = :titulo, genero = :genero , anio = :anio WHERE id = :id ");

        $stmt -> execute([
            ':titulo' => $titulo,
            ':genero' => $genero,
            ':anio' => $anio,
            ':id' => $id
        ]);
        return true;

      } catch (PDOException $e) {return false;}
    }

    //funcion eliminar.
   public function eliminar(int $id): bool
{
    try
    {
        $stmt = $this->pdo->prepare("DELETE FROM peliculas WHERE id = :id");
        $stmt->execute([':id' => $id]);
        return true;
    }
    catch (PDOException $e)
    {
        return false;
    }
}
}
?>