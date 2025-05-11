--hacer esto es lo mismo que simplificar nombre
nombrePar::String -> Bool
nombrePar nombre = (even . length) nombre

nombrePar'::String -> Bool
nombrePar' = even . length

nombrePar''::String -> Bool
nombrePar'' nombre = even (length nombre)

main :: IO()
main = do
    putStrLn(show (nombrePar "Holaa"))
    putStrLn(show (nombrePar' "Holaa"))
    putStrLn(show (nombrePar'' "Holaa"))
    