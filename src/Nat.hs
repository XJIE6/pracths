module Nat where


-- data Nat = Zero | Succ Nat

data Nat where
  Zero :: Nat
  Succ :: Nat -> Nat deriving(Eq)


plus :: Nat -> Nat -> Nat
plus Zero n = n
plus (Succ m) n = m `plus` (Succ n)

minus :: Nat -> Nat -> Nat
minus Zero _ = Zero
minus n Zero = n
minus (Succ n) (Succ m) = minus n m

toNum :: Num n => Nat -> n
toNum = go 0
  where
    go a Zero = a
    go a (Succ m) = go (a + 1) m

fromIntegral :: Integral i => i -> Maybe Nat
fromIntegral i
  | i < 0 = Nothing
  | otherwise = Just $ go Zero i
    where
      go a 0 = a
      go a k = go (Succ a) (k - 1)

instance Show Nat where
  show n = "Nat(" <> show (toNum n :: Integer) <> ")"
