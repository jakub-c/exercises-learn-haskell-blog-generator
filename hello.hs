main = putStrLn myhtml
myhtml = 
  makeHtml
    "My page title"
    (h1_ "Hello world!" <> p_ "this is a paragraph")

makeHtml :: String -> String -> String
makeHtml title content = html_ (head_ (title_ title) <> body_ content)

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

html_ :: String -> String
html_ = el "html"
body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"
title_ :: String -> String
title_ = el "title"

-- written using lambda function for the sake of the exercise
h1_ :: String -> String
h1_ = (\arg -> el arg) "h1"

p_ :: String -> String
p_ = el "p"