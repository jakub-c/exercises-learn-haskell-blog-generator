module Html.Internal
  ( Html
  , Title
  , Structure
  , html_
  , p_
  , code_
  , h1_
  , li_
  , ul_
  , ol_
  , render
  )
  where
import Text.XHtml (content)

-- * Types

newtype Html
  = Html String

newtype Structure
  = Structure String

type Title
  = String

-- * EDSL

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el "html"
      ( el "head" (el "title" (escape title))
        <> el "body" (getStructureString content)
      )
    )

p_ :: String -> Structure
p_ = Structure . el "p" . escape

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

li_ :: Structure -> Structure
li_ (Structure content) = Structure (el "li" content)

htmlList :: String -> [Structure] -> Structure
htmlList listType structures = Structure (el listType (concat (map getStructureString (map li_ structures))))

ul_ :: [Structure] -> Structure
ul_ = htmlList "ul"

ol_ :: [Structure] -> Structure
ol_ = htmlList "ol"

-- my answer to Semigroup refactoring excericse from
--  https://learn-haskell.blog/04-markup/03-displaying_results.html

-- instance Semigroup Structure where
--   (<>) :: Structure -> Structure -> Structure
--   Structure x <> Structure y = Structure (x ++ y)

instance Semigroup Structure where
  (<>) c1 c2 =
    Structure (getStructureString c1 <> getStructureString c2)


-- * Render

render :: Html -> String
render html =
  case html of
    Html str -> str

-- * Utilities

print :: Show a => a -> IO ()
print = putStrLn . show

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str

escape :: String -> String
escape =
  let
    escapeChar c =
      case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
  in
    concat . map escapeChar