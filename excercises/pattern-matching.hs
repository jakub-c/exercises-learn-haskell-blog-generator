-- excericse from 4.4. Parsing markup part 02 (Pattern matching)

import Data.Maybe

import Data.Word (Word8) -- Word8 is an 8-bit unsigned integer type

main :: IO ()
main = putStrLn "pattern matching excercise"

-- | A data type representing colors
data Color
  = RGB Word8 Word8 Word8

getBluePart :: Color -> Word8
getBluePart color =
  case color of
    RGB _ _ blue -> blue

data Brightness
  = Dark
  | Bright

data EightColor
  = Black
  | Red
  | Green
  | Yellow
  | Blue
  | Magenta
  | Cyan
  | White

data AnsiColor
  = AnsiColor Brightness EightColor

ansiColorToVGA :: AnsiColor -> Color
ansiColorToVGA ansicolor =
  case ansicolor of
    AnsiColor Dark Black ->
      RGB 0 0 0
    AnsiColor Bright Black ->
      RGB 85 85 85
    AnsiColor Dark Red ->
      RGB 170 0 0
    AnsiColor Bright Red ->
      RGB 255 85 85
    -- and so on

isBright :: AnsiColor -> Bool
isBright ansicolor =
    case ansicolor of
        AnsiColor Bright _ -> True
        _ -> False

-- my answer
-- ansiToUbuntu :: AnsiColor -> Color
-- ansiToUbuntu ansicolor =
--     case ansicolor of
--         AnsiColor _ Black ->
--             RGB 1 1 1
--         AnsiColor Bright Red ->    
--             RGB 222 56 43

ansiToUbuntu :: AnsiColor -> Color
ansiToUbuntu ansiColor =
  case ansiColor of
    AnsiColor brightness color ->
      case brightness of
        Dark ->
          case color of
            Black -> RGB 1 1 1
            Red -> RGB 22 56 43


isEmpty :: [a] -> Bool
isEmpty list =
    case listToMaybe list of
        Just _ -> True
        Nothing -> False

-- don't use `listToMaybe`
-- my answer
-- isEmpty2 :: [a] -> Bool
-- isEmpty2 list =
--     case length list of
--         0 -> False
--         _ -> True

isEmpty2 :: [a] -> Bool
isEmpty2 list =
  case list of
    [] -> True
    _ : _ -> False