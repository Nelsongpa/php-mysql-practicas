<?php 
    class ProductoRepository
    {
        private PDO $pdo;
        
        public function __construct(PDO $pdo)
        {
            $this->pdo = $pdo;
        }

        public function listar(): array
        {
            $stmt = $this->pdo->prepare("SELECT * FROM producto ORDER BY nombre ASC");
            $stmt->execute();
            return $stmt->fetchAll();
        }

        public function agregarProducto(string $nombre, int $cantidad): bool
        {
            try 
            {
                $stmt = $this->pdo->prepare("INSERT INTO producto (nombre, cantidad) VALUES (:nombre, :cantidad)");

                $stmt->execute([
                    ':nombre' => $nombre,
                    ':cantidad' => $cantidad
                ]);
                return true;
            }catch(PDOException $e){return false;}
        }

        public function actualizarProducto(int $id, string $nombre, int $cantidad): bool
        {
            try
            {
                $stmt = $this->pdo->prepare("UPDATE producto SET nombre = :nombre, cantidad = :cantidad WHERE id = :id");
                $stmt->execute([
                    ':id'       => $id,
                    ':nombre'   => $nombre,
                    ':cantidad' => $cantidad
                ]);
                return true;
            }
            catch(PDOException $e){return false;}
        }

        public function eliminarProducto(int $id):bool
        {
            try 
            {
                $stmt = $this->pdo->prepare("DELETE FROM producto WHERE id = :id");
                $stmt->execute([':id' => $id]);
                return true;
            }catch(PDOException $e){return false;}
        }
    }