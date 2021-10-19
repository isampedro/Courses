module Lists where

foldLeft :: (b -> a -> b) -> b -> [a] -> b
foldLeft f z0 [] = z0
foldLeft f z0 (x : xs) = f (foldLeft f z0 xs) x

foldRight :: (a -> b -> b) -> b -> [a] -> b
foldRight f z0 [] = z0
foldRight f z0 (x : xs) = foldRight f (f x z0) xs

map :: (a -> b) -> [a] -> [b]
map change = foldLeft (\l x -> change x : l) []

length :: [a] -> Int
length = foldRight (\x length' -> length' + 1) 0

filter :: (a -> Bool) -> [a] -> [a]
filter pred = foldLeft (\l a -> if pred a then a : l else l) []
