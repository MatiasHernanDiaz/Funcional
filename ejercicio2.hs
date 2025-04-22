main :: IO ()
main = do
    numero <- readLn
    case numero of
        _ | numero < 1 -> putStrLn "es menor que 1 "
        1 -> putStrLn "uno"
        2 -> putStrLn "dos"
        3 -> putStrLn "tres"
        4 -> putStrLn "cuatro"
        5 -> putStrLn "cinco"
        6 -> putStrLn "seis"
        7 -> putStrLn "siete"
        8 -> putStrLn "ocho"
        9 -> putStrLn "nueve"
        10 -> putStrLn "diez"
        _ -> putStrLn "No match found"