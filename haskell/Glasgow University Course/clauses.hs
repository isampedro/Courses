-- let expression
-- let expressions are expressions; let can be used anywhere an expression is allowed.
journeycost :: Float -> Float -> Float
journeycost miles fuelcostperlitre =
  let milespergallon = 35
      litrespergallon = 4.55
      gallons = miles / milespergallon
   in (gallons * litrespergallon * fuelcostperlitre)

-- where clause
-- where clauses are not expressions; they can be used only to provide some local variables for a top level equation.
squareplusone :: Int -> Int
squareplusone x = xsquared + 1
  where
    xsquared = x * x

cel2fahr :: Float -> Float
cel2fahr x = (x * scalingfactor) + freezingpoint
  where
    scalingfactor = 9.0 / 5.0
    freezingpoint = 32
