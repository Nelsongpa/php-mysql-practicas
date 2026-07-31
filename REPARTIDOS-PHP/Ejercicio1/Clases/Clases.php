<?php

$arr_inventario = [];// creamos una array vacio

class Inventario {// creamos una clase inventario
    private int $id;// propiedades
    private string $nombre;
    private int $stock;

    public function __construct(string $nombre, int $stock) {// el construtor usando las propiedades agregadas
        $this->nombre = $nombre;
        $this->stock  = $stock;
        $this->id     = $this->fnID(); // ID automático por eso no se agrega con las otras en el contructor
    }

    // función privada que genera el ID solo
    private function fnID(): int {
        global $arr_inventario;
        return count($arr_inventario) + 1;
    }

    
    public function getID(): int {
        return $this->id;
    }
    public function getNombre(): string {
        return $this->nombre;
    }
    public function getStock(): int {
        return $this->stock;
    }
    public function setNombre(string $n): void {
        $this->nombre = $n;
    }
    public function setStock(int $s): void {
        $this->stock = $s;
    }
}