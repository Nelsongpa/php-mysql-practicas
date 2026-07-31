<?php
require_once __DIR__ . '/../Clases/clases.php';
 
$id =(int) readline("ingrese el numero del ID: ");// aqui el usuario ingresa el id
$cantidad=(int)readline("ingrese el numero que decea reducir ");// aqui declaramos una variable donde el usuarion va a colocar la vatidad de producto
// por que se pone int para que el mensaje que mande realine que siempra manda un string se tranforme en un int
$existe = false;// variable  bandera
foreach ($arr_inventario as $item) {//n foreach que recorre el array 
 if($item -> getID() == $id){// un if conde le damos como condicion que item saque en dato de id por memdio del get y verifique que son iguales
    $existe = true; // si son iguales seria verdadero
 if($item->getStock() >= $cantidad){// luego un if donde el item pide la informacion del estock y verifica que sea mayor o igual a la cantidad de producto que quieren ingresar
    $item ->setStock($item ->getStock() - $cantidad);// luego restamos los productos ingresados al stock 
    echo " Se a aactualisado el stock ";// mensaje donde se verifica lo ingresado
   
 }else {
    echo " Error se sobre pasa la cantidad de producto al stock"; // si no cumple improme este error
}
 }
}


?>