curry :: ((a, b) -> c) -> a -> b -> c
curry f x y = f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (x, y) = f x y

apply :: (a -> b) -> a -> b
apply f = f

twice :: (a -> a) -> a -> a
twice f = f . f

id :: a -> a
id x = x