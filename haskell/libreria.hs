-- PREGUNTAS
-- ¿Es cierto que alguien escribió una determinada obra?
-- ¿Quién o quienes escribieron una obra?
-- Qué obra escribió una persona?
-- Si es cierto que cierta persona escribió alguna obra, sin importal cual.
-- Si es cierto que cierta obra existe


type Obra = String
type Nombre = String

data Autor = Autor{
    nombre :: Nombre,
    obras :: [Obra]
} deriving (Show)

contiene :: Obra -> [Obra] -> Bool --PREGUNTA 1
contiene obra [] = False
contiene obra (x:xs)
    | obra == x = True
    | otherwise = contiene obra xs

escribioObra :: Autor -> Obra -> Bool -- PREGUNTA 1
escribioObra autor obra = contiene obra (obras autor)

filter2 :: Obra -> [Autor] -> [Nombre] -- PREGUNTA 2
filter2 obra [] = []
filter2 obra (x:xs)
    | contiene obra (obras x) = nombre x : filter2 obra xs
    | otherwise = filter2 obra xs

obrasDe :: Autor -> [Obra] -- PREGUNTA 3
obrasDe = obras

escribioAlgunaObra :: Autor -> Bool -- PREGUNTA 4 esta pense yo
escribioAlgunaObra autor
    | length (obras autor) > 0 = True
    | otherwise = False

escribioAlgunaObra2 :: Autor -> Bool -- PREGUNTA 4 esta se le ocurrio al copilot
escribioAlgunaObra2 autor = not (null (obras autor))

existeObra :: Obra -> [Autor] -> Bool -- PREGUNTA 5
existeObra obra [] = False
existeObra obra (x:xs)
    | contiene obra (obras x) = True
    | otherwise = existeObra obra xs

juan = Autor{
    nombre = "Juan",
    obras = ["Obra1", "Obra2"]
}

pedro::Autor
pedro = Autor{
    nombre = "Pedro",
    obras = ["Obra3", "Obra4"]
}

maria::Autor
maria = Autor{
    nombre = "Maria",
    obras = ["Obra5", "Obra6"]
}

autores :: [Autor]
autores = [juan, pedro, maria]



main :: IO()
main = do
    putStrLn (show (escribioObra juan "Obra1")) -- True
    putStrLn (show (escribioObra juan "Obra3")) -- False
    putStrLn (show (filter2 "Obra1" autores)) -- [Juan]
    putStrLn (show (filter2 "Obra3" autores)) -- [Pedro]
    putStrLn (show (filter2 "Obra8" autores)) -- []
    putStrLn (show (existeObra "Obra8" autores)) -- False
    putStrLn (show (existeObra "Obra4" autores)) -- True