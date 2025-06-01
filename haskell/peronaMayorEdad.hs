edad:: (String, Int) -> Int
edad = snd

mayorEdad :: Int -> Bool
mayorEdad edad =  edad >= 18

type Persona = (String, Int)
personaMayorEdad:: Persona -> Bool
personaMayorEdad persona = (mayorEdad . edad) persona

juan = ("Juan", 20)
pedro = ("Pedro", 17)
maria = ("Maria", 18)
ana = ("Ana", 15)


main :: IO()
main = do
    putStrLn(show (personaMayorEdad juan))
    putStrLn(show (personaMayorEdad pedro))
    putStrLn(show (personaMayorEdad maria))
    putStrLn(show (personaMayorEdad ana))