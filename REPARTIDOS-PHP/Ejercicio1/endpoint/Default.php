<?php
require_once __DIR__ . '/../Clases/Clases.php';// aqui por el require nos conectamos a la hoja clases.php

array_push($arr_inventario, new Inventario("Cerveza", 20));// aqui de manera directa metemos productos usado array push
array_push($arr_inventario, new Inventario("Vinos", 100));// se usa el construtor creado de la hoja clases y solo se crea los onjetos(productos)
array_push($arr_inventario, new Inventario("Ron", 50));
?>