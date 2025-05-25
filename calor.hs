-- Tipo de dato para representar una simulación de calor
data Simulacion = Simulacion {
    alpha :: Double,
    dx :: Double,
    dt :: Double,
    estado :: [Double]
}

-- Calcula el coeficiente de difusión r en base a los parámetros
coeficienteR :: Simulacion -> Double
coeficienteR sim = alpha sim * dt sim / (dx sim * dx sim)

-- Calcula el siguiente estado
nextStep :: Simulacion -> [Double]
nextStep sim = bordeInicial ++ paso (estado sim) ++ bordeFinal
  where
    r = coeficienteR sim
    paso (a:b:c:rest) = (b + r * (a - 2*b + c)) : paso (b:c:rest)
    paso _ = []
    bordeInicial = [head (estado sim)]
    bordeFinal = [last (estado sim)]

-- Genera todos los pasos de la simulación
simulate :: Int -> Simulacion -> [[Double]]
simulate 0 sim = [estado sim]
simulate n sim = estado sim : simulate (n - 1) sim { estado = nextStep sim }

-- Visualización
mostrarSimulacion :: [[Double]] -> IO ()
mostrarSimulacion = mapM_ (putStrLn . map simbolo)
  where
    simbolo temp
      | temp > 80 = '#'
      | temp > 40 = '*'
      | temp > 10 = '+'
      | otherwise = '.'

-- Simulación inicial
simulacionInicial :: Simulacion
simulacionInicial = Simulacion {
    alpha = 5.0,
    dx = 1.0,
    dt = 0.1,
    estado = [ if i == 0 then 100 else 0 | i <- [0..10] ]
}

-- Punto de entrada
main :: IO ()
main = mostrarSimulacion (simulate 20 simulacionInicial)
