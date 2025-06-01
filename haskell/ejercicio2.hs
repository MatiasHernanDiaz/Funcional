fun1 :: Int -> String
fun1 1 = "uno"
fun1 2 = "dos"
fun1 3 = "tres"
fun1 4 = "cuatro"
fun1 5 = "cinco"
fun1 6 = "seis"
fun1 7 = "siete"
fun1 8 = "ocho"
fun1 9 = "nueve"
fun1 0 = "Debe ingresar un numero natural"
fun1 x
  | x < 0 = fst(fun2 x)
fun1 _ = "Mayor"


fun2 :: Int -> (String, Int)
fun2 x
  | x < 0 = ("negativo", (-1))
  | x == 0 = ("cero", 0)
  | x > 0 = ("positivo", 1)
  | otherwise = ("No es num", 0)