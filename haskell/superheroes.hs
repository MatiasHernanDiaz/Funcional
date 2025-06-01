import Control.Monad.RWS (MonadState(put))


type Tag = String

data Carta = Carta {
    nombre :: String,
    velocidad :: Int,
    altura :: Int,
    peso :: Int,
    fuerza :: Int,
    peleas :: Int,
    tags :: [Tag]

} deriving (Eq, Show)


batman :: Carta
batman = Carta {
    nombre = "Batman",
    velocidad = 10,
    altura = 2,
    peso = 80,
    fuerza = 100,
    peleas = 100,
    tags = ["humano", "millonario"]
}

superman :: Carta
superman = Carta {
    nombre = "Superman",
    velocidad = 20,
    altura = 3,
    peso = 90,
    fuerza = 200,
    peleas = 200,
    tags = ["extraterrestre", "superheroe"]
}

ironman :: Carta
ironman = Carta {
    nombre = "Ironman",
    velocidad = 15,
    altura = 2,
    peso = 85,
    fuerza = 150,
    peleas = 150,
    tags = ["humano", "millonario"]
}

hulk :: Carta
hulk = Carta {
    nombre = "Hulk",
    velocidad = 25,
    altura = 4,
    peso = 100,
    fuerza = 300,
    peleas = 300,
    tags = ["humano", "superheroe"]
}

flash :: Carta
flash = Carta {
    nombre = "Flash",
    velocidad = 30,
    altura = 1,
    peso = 70,
    fuerza = 50,
    peleas = 50,
    tags = ["humano", "superheroe11"]
}


cambiarTag :: Tag -> Tag -> [Tag] -> [Tag]
cambiarTag _ _ [] = []
cambiarTag viejo nuevo (x:xs)
    | x == viejo = nuevo : cambiarTag viejo nuevo xs
    | otherwise = x : cambiarTag viejo nuevo xs


cambiarTagEnCarta :: Tag -> Tag -> Carta -> Carta
cambiarTagEnCarta viejo nuevo carta = carta {tags = cambiarTag viejo nuevo (tags carta)}

cambiarTagEnMazo :: Tag -> Tag -> [Carta] -> [Carta]
cambiarTagEnMazo viejo nuevo = map (cambiarTagEnCarta viejo nuevo)


mazo :: [Carta]
mazo = [batman, superman, ironman, hulk, flash]

comienzaCon :: String -> Carta -> Bool
comienzaCon prefijo carta = take (length prefijo) (nombre carta) == prefijo

todasLasCartasQueComienzanCon :: String -> [Carta] -> [String]
todasLasCartasQueComienzanCon prefijo = map nombre . filter (comienzaCon prefijo)



tagLargo :: [Tag] -> Int -> Bool
tagLargo tags largo = any ((> largo) . length) tags

cartasConTagLargo :: [Carta] -> Int -> Bool
cartasConTagLargo cartas largo = any ( \carta -> tagLargo (tags carta) largo) cartas


main :: IO()
main = do
    putStrLn (show (todasLasCartasQueComienzanCon "Bat" mazo))
    putStrLn (show (batman))
    putStrLn (show (cartasConTagLargo mazo 15)) --extraterrestre tiene  14
    putStrLn (show (cartasConTagLargo mazo 10)) --superheroe11 tiene 12
    putStrLn (show (cambiarTagEnMazo "superheroe11" "superheroe" mazo))