{-# LANGUAGE LambdaCase #-}

data Pizza = Prepizza | Capa Ingrediente Pizza deriving (Eq, Show)

data Ingrediente = Aceitunas Int | Anchoas | Cebolla | Jamon | Queso | Salsa deriving (Eq, Show)

cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza = 0
cantidadDeCapas (Capa _ p) = 1 + cantidadDeCapas p

cantidadDeAceitunas :: Pizza -> Int
cantidadDeAceitunas Prepizza = 0
cantidadDeAceitunas (Capa (Aceitunas n) p) = n + cantidadDeAceitunas p
cantidadDeAceitunas (Capa _ p) = cantidadDeAceitunas p

mapPizza :: (Ingrediente -> a) -> (a -> a -> a) -> a -> Pizza -> a
mapPizza f recc zo Prepizza = zo
mapPizza f recc zo (Capa i p) = recc (f i) (mapPizza f recc zo p)

duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas =
  mapPizza
    ( \case
        Aceitunas n -> Capa (Aceitunas (2 * n)) Prepizza
        i -> Capa i Prepizza
    )
    (\(Capa i p) p2 -> Capa i p2)
    Prepizza

addIngrediente :: Ingrediente -> Pizza -> Pizza
addIngrediente i p = Capa i p

addNewLayer :: Pizza -> Pizza -> Pizza
addNewLayer Prepizza p2 = p2
addNewLayer (Capa i p) p2 = Capa i p2

sinLactosa :: Pizza -> Pizza
sinLactosa =
  mapPizza
    ( \case
        Queso -> Prepizza
        i -> addIngrediente i Prepizza
    )
    addNewLayer
    Prepizza

aptaIntoleranteLactosa :: Pizza -> Bool
aptaIntoleranteLactosa p = sinLactosa p == p