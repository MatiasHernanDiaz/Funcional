main :: IO()
main = putStrLn "hellow"

--elmayordelostres :: Ord a => a -> a -> a -> a
-- max x y --> mayor entre x e y
--max :: Ord a => a -> a -> a
-- Elmayordelostres x y z = x `max` y `max` z
xor :: Bool -> Bool -> Bool
xor True True = False
xor x y = x || y

esMuchoMayor :: (Ord a, Num a) => a -> a -> Bool
esMuchoMayor x y = (x - y) > 10

-- x bool
-- y string
-- g 
-- f x y = g (h y ( i x y ) x ) y
f :: Bool -> String -> Bool
f False "" = True
h :: String -> ALGO Bool -> Bool -> Bool
y :: String
g :: Bool -> String -> Bool
i :: Bool -> String -> ALGO Bool

funcionRara2 :: (Num b -> a ) -> a
funcionRara2 g m = g.length m
length String -> Int
funcionRara2 (Int -> a) -> String -> a
g :: Int -> a