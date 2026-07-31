<?php
require_once __DIR__ . '/../Clases/Clases.php';// aqui estamos conectando este archivo co el archivo Clase.php (/../) <- es para decir que busque en la  carpeta de arriba

$nombre = readline("ingrese nombre:"); //el cliente agrega el nombre 
$stock = readline("ingrese numero  producto");// el cliente agregar el numero de productos qie ingresa

$existe = false; // variable bandera que la vamos a usar para saber si ya esta agregado el productoo

foreach($arr_inventario as $item){// un foreach para recorrer el array
    if($item -> getNombre() == $nombre){// la variable $item pide el nombre por el metodo get y verifica que sea igual si ya hay uno registrado
        $existe= true;// si esta registrado con el nombre es true
    }
}

if(!$existe){ // este if es para  verficar si el producto esta agregado para no agregar donle
    $nuevo_producto =new Inventario($nombre,$stock);// creamos un objeto con la palabtra new usando parametros 
    $arr_inventario[] = $nuevo_producto  ;// y cada porduto esta en la variable $nuevo producto y se agrega al array
    echo "producto Agregado con ID: " . $nuevo_producto ->getID() . "\n";// imprimimos  si todo esta bien que se agrego el producto  y se le agrega de forma automatica un id

} else {
 echo "Error : ya existe el producto";
}