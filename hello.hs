import Html

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "My title"
    ( append_
      (h1_ "Heading")
      ( append_
        ( append_
          (p_ "Paragraph #1")
          (p_ "Paragraph #2")
        )
        (ul_
          [ p_ "item 1"
          , p_ "item 2"
          , p_ "item 3"
          ])
      )
    )