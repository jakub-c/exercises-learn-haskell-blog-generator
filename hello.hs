main :: IO ()
main = putStrLn (render myhtml)

newtype Html = Html String
newtype Structure = Structure String

type Title = String

myhtml :: Html
myhtml =
  html_
    "Hello world title!"
    (append_
      (h1_ "heading")
      (append_
        (p_ "paragraph1")
        (p_ "paragraph2")
      )
    )

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

render :: Html -> String
render (Html str) = str

getStructureString :: Structure -> String
getStructureString struct =
  case struct of
    Structure str -> str

html_ :: Title -> Structure -> Html
html_ title content =
  Html 
    (el "html"
      (el "head" (el "title" title)
        <> el "body" (getStructureString content)
      )
    )

-- written using lambda function for the sake of the exercise
h1_ :: String -> Structure
h1_ = Structure . (\arg -> el arg) "h1"

p_ ::  String -> Structure
p_ = Structure . el "p"