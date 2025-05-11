-- 50 la hora, minimo 2 horas

--la funcion max se puede apicar x max y ooo (max x) y entonces
--definimos max asi

maximo :: Int -> Int
maximo = max 2

precioXHora :: Int -> Int
precioXHora = (50 * )

total :: Int -> Int
total = (precioXHora . maximo)

main :: IO()
main = do
    putStrLn(show (total 1)) -- 100
    putStrLn(show (total 2)) -- 100
    putStrLn(show (total 3)) -- 150
    putStrLn(show (total 4))