<?php // este archivo tiene como onjetivo buscar productos 
require_once __DIR__ . '/../Clases/Clases.php';// conectamos los archivos

foreach ($arr_inventario as $item){// un foreach para recorrer el array
    echo "ID: " .$item-> getID() . "\n".// pedimos el id por medio del metodo get
         "nombre : " . $item-> getNombre() . "\n". // pedimos el nombre por el metodo get
         "Stock: " . $item-> getStock() . "\n" ;// solo se usa un echo para hora codigo es un solo bloque dandole un salto de lindia a cada uno
         
}

?>