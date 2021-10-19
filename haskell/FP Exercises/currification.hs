import Data.Tuple

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

flip :: (a -> a -> b) -> a -> a -> b
flip f x y = f y x

uflip :: ((b, a) -> c) -> (a, b) -> c
uflip f = f . swap

const :: a -> a -> a
const x _ = x

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g = f . g