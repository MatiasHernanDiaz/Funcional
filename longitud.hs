
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

main :: IO ()
main = print (longitud [1,2,3,4,5])