


miMap :: (t -> Bool) -> [t] -> Bool
miMap f [] = True
miMap f(x:xs) = f x && miMap f xs

todosPar = miMap even

main :: IO ()
main = print(todosPar[10,2])