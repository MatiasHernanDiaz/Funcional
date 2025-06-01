-- Alimentos con mas de 100 calorias
-- De los pocos caloricos si hay alguno  que tenga mas proteinas que grasas
-- entre los alimentos mas caloricos, tengna mas proteinas que grasas
type Alimento = String

data InformacionNutricional = InformacionNutricional {
    alimento :: Alimento,
    calorias :: Int,
    grasas :: Float,
    carbohidratos :: Float,
    proteinas :: Float
} deriving (Show)


alimentos :: [InformacionNutricional]
alimentos = [
    InformacionNutricional "Manzana" 52 0.2 14 0.3,
    InformacionNutricional "Platano" 89 0.3 23 1.1,
    InformacionNutricional "Naranja" 147 1.1 12 0.9,
    InformacionNutricional "Fresa" 32 0.3 7.7 0.7,
    InformacionNutricional "Uva" 169 0.2 18 0.6,
    InformacionNutricional "Sandia" 30 1.2 8 0.6,
    InformacionNutricional "Pera" 57 0.1 15 0.4,
    InformacionNutricional "Piña" 50 0.1 13 0.5,
    InformacionNutricional "Mango" 60 0.4 15 0.8,
    InformacionNutricional "Papaya" 101 0.4 11 0.5]


masDe100 :: InformacionNutricional -> Bool
masDe100 alimento = calorias alimento > 100

filterMasDe100 :: [InformacionNutricional] -> [Alimento]
filterMasDe100 [] = []
filterMasDe100 (x:xs)
    | masDe100 x = alimento x : filterMasDe100 xs
    | otherwise = filterMasDe100 xs
    
-- aca fue para jugar un poco
filterGenerico :: (a -> Bool) -> [a] -> [a]
filterGenerico _ [] = []
filterGenerico f (x:xs)
    | f x = x : filterGenerico f xs
    | otherwise = filterGenerico f xs


-- mapGenerico 
mapGenerico :: (a -> b) -> [a] -> [b]
mapGenerico _ [] = []
mapGenerico f (x:xs) = f x : mapGenerico f xs


masProteinasQueGrasas :: InformacionNutricional -> Bool
masProteinasQueGrasas info = proteinas info > grasas info

masProteicos :: [InformacionNutricional] -> [Alimento]
masProteicos = map alimento . filter masProteinasQueGrasas . masCaloricos 


masCaloricos :: [InformacionNutricional] -> [InformacionNutricional]
masCaloricos = filter masDe100


main :: IO()
main = do
    putStrLn (show ( map alimento (filter masDe100 alimentos))) -- con filter nativo
    putStrLn (show (filterMasDe100 alimentos)) -- con filter propio
    putStrLn (show (mapGenerico alimento (filterGenerico masDe100 alimentos))) -- con filter generico
    putStrLn (show (masProteicos alimentos)) 
