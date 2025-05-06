filter _ [] = []
filter condicion (x:xs) = 
    _ | condicion x = x : filter condicion xs
    _ | otherwise = filter condicion xs