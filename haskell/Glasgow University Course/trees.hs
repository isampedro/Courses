import Distribution.Types.Benchmark.Lens (Benchmark)

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show)

treeDepth :: Tree a -> Int
treeDepth Leaf = 0
treeDepth (Node _ leftSubtree rightSubtree) =
  1 + max (treeDepth leftSubtree) (treeDepth rightSubtree)

treeSum :: Tree Int -> Int
treeSum Leaf = 0
treeSum (Node x leftSubtree rightSubTree) = x + treeSum leftSubtree + treeSum rightSubTree

isSortedTree :: Tree Int -> Int -> Int -> Bool
isSortedTree Leaf _ _ = True
isSortedTree (Node x leftSubtree rightSubtree) minVal maxVal =
  let leftSorted = isSortedTree leftSubtree minVal x
      rightSorted = isSortedTree rightSubtree x maxVal
   in x >= minVal && x < maxVal && leftSorted && rightSorted

addNewMax :: Tree Int -> Tree Int
addNewMax Leaf = Node 0 Leaf Leaf
addNewMax (Node x t1 Leaf) = Node x t1 (Node (x + 1) Leaf Leaf)
addNewMax (Node x t1 t2) = Node x t1 (addNewMax t2)

addNewSortedValue :: Tree Int -> Int -> Tree Int
addNewSortedValue Leaf x = Node x Leaf Leaf
addNewSortedValue (Node value a b) x =
  if x < value
    then Node value (addNewSortedValue a x) b
    else Node value a (addNewSortedValue b x)

toList :: Tree a -> [a]
toList Leaf = []
toList (Node value a b) = value : (toList a ++ toList b)

foldTreeLeft :: (b -> b -> b) -> (b -> a -> b) -> b -> Tree a -> b
foldTreeLeft g f zo Leaf = zo
foldTreeLeft g f zo (Node value a b) = f (g (foldTreeLeft g f zo a) (foldTreeLeft g f zo a)) value

maxInTree :: Tree Int -> Int
maxInTree = foldTreeLeft max max 0