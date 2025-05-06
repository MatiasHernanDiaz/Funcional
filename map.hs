
-- duplicarTodo :: Num a => [a] -> [a]
-- duplicarTodo [] = []
-- duplicarTodo (x:xs) = doble x : duplicarTodo xs

doble :: Num a => a -> a
doble x = x*2

miMap :: (t -> a) -> [t] -> [a]
miMap f [] = []
miMap f(x:xs) = f x: miMap f xs

duplicarTodo = miMap doble

main :: IO ()
main = print(duplicarTodo[3,5])
