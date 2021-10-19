absolute :: (Ord a, Num a) => a -> a
absolute x
  | x < 0 = -x
  | otherwise = x

--holeScore :: Int -> Int -> String
--holeScore strokes par
--  | strokes < par = show (par-strokes) ++ " under par"
--  | strokes == par = "level par"
--  | strokes > par = show(strokes-par) ++ " over par"

holeScore :: Int -> Int -> String
holeScore strokes par
  | score < 0 = show (abs score) ++ " under par"
  | score == 0 = "level par"
  | otherwise = show (score) ++ " over par"
  where
    score = strokes - par

-- case expression
data Pet = Cat | Dog | Fish | Parrot String

hello :: Pet -> String
hello x =
  case x of
    Parrot name -> "pretty " ++ name
    _ -> "grunt"