import Data.Maybe

complicatedF x = sin x / x

leftLim :: RealFloat a => (a -> a) -> a -> Maybe a
leftLim f x =
  if isNaN fx
    then Nothing
    else Just fx
  where
    h = 0.0000000001
    fx = f (x - h)

rightLim :: RealFloat a => (a -> a) -> a -> Maybe a
rightLim f x =
  if isNaN fx
    then Nothing
    else Just fx
  where
    h = 0.0000000001
    fx = f (x + h)

unHandleNum :: RealFloat a => Maybe a -> a
unHandleNum Nothing = -1000000000000
unHandleNum (Just n) = n

lim :: RealFloat a => (a -> a) -> a -> (Maybe a, Maybe a)
lim f x = (leftLim f x, rightLim f x)