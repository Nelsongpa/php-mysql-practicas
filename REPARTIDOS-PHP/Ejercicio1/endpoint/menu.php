<?php
require_once __DIR__ .'/../Clases/Clases.php';
// aqui creamos el menu de opciones
do {
    echo "opcion1 agregar producto \n";
    echo "opcion2 consultar \n";
    echo "opcion3 reducir \n";
    echo "opcion4 Default \n";
    echo "opcion5 Salir \n";

 $opcion= readline("eliha una opcion");  

 switch ($opcion) { // un switch para que el usuario seleciones alguna y al selecionar un se detien el switch
    case '1':
        require_once __DIR__ . '/endpoints/create.php';// usamos require para conectar hojas y no repetir el codigo con su propia direccion
        break;
    case '2':
        require_once __DIR__ . '/endpoints/consultar.php';// en cada una lo hacemos ya que el codigo esta echo el diferentes archivo asi se ve mas profesional
        break;
    case '3':
        require_once __DIR__ . '/endpoints/reducir.php';
        break;
    case '4':
        require_once __DIR__ . '/endpoints/default.php';
        break;
}
    default:
        
        break;
 }
} while ($opcion !='5'); //

?>