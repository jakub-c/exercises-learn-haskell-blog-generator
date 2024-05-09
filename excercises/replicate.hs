-- excericse from Parsing markup part 01 (Recursion) chapter

main :: IO ()
main = putStrLn (concat (replic 2 "a"))

-- replicate is a Haskell function, hence a new name
replic :: Int -> a -> [a]
replic times el =
    if times /= 1
        then el : replic (times-1) el
        else [el]