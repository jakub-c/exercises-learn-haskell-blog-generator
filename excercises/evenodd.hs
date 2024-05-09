-- excericse from Parsing markup part 01 (Recursion) chapter

main :: IO ()
main = putStrLn (show (oddd 4))
    
-- even and odd are Haskell functions, hence a new name
evenn :: Int -> Bool
evenn n =
    if n == 0
        then True
        else oddd (n-1)

oddd :: Int -> Bool
oddd n =
    if n == 0
        then False
        else evenn (n-1)