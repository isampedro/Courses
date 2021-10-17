spellWord :: [Char] -> [Char]
spellWord [] = []
spellWord word = head word : " is for " ++ word

speller :: [[Char]] -> [Char]
speller = foldr (\word words -> if words == "" then spellWord word ++ ", " ++ words else spellWord word) ""