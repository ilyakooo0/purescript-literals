module Test.Main where

import Prelude

import Effect (Effect)
import Literals (NumberLit, StringLit, IntLit, intLit, numberLit, stringLit)
import Literals.Undefined (undefined)
import Test.Assert (assertEqual, assertTrue)
import Unsafe.Coerce (unsafeCoerce)


main :: Effect Unit
main = do
  assertEqual
    { actual: unsafeCoerce (stringLit :: StringLit "foo")
    , expected: "foo"
    }
  assertEqual
    { actual: unsafeCoerce (numberLit :: NumberLit "8.0")
    , expected: 8.0
    }
  assertEqual
    { actual: unsafeCoerce (numberLit :: NumberLit "-8.0")
    , expected: -8.0
    }
  assertEqual
    { actual: unsafeCoerce (intLit :: IntLit "8")
    , expected: 8
    }
  assertEqual
    { actual: unsafeCoerce (intLit :: IntLit "-8")
    , expected: -8
    }

  -- Eq instance
  assertTrue $ undefined == undefined
  assertTrue $ (stringLit :: StringLit "foo") == (stringLit :: StringLit "foo")

  -- Show instance
  assertEqual
    { actual: show (stringLit :: StringLit "foo")
    , expected: "(Literal \"foo\")"
    }
  assertEqual
    { actual: show (numberLit :: NumberLit "8.0")
    , expected: "(Literal 8.0)"
    }
  assertEqual
    { actual: show (intLit :: IntLit "8")
    , expected: "(Literal 8)"
    }
  assertEqual
    { actual: show undefined
    , expected: "Undefined"
    }
