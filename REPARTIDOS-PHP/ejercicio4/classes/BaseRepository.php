<?php

/*Aqui declaramos una clase abstracta significa que no se puede instaciar directamentente osea solo sirve como molde
 para que otra clases se pueda extender. luego usamos protected PDP $pdo  esto declara la propiedad del atributo de 
 la clase llamada pdo el protected lo que nos indica es que se es visisble desde esta clase y de la clase que lo 
 hereden con extends luego  hicimos un construtor que recibe el objeto PDO y lo guarda en la propiedad $this ->pdo */
 abstract class  BaseRepository{
    protected PDO $pdo;

    public function __construct(PDO $pdo){
        $this ->pdo = $pdo;
    }
}



?>