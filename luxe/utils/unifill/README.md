# Unifill

Shim your code to support Unicode across all platforms.

## Usage

`using unifill.Unifill` introduce the methods whose names start with u
into the String class. Replace all methods of String in your code with
Unifill's methods, and your code become able to deal with Unicode
strings across all platforms.

```haxe
using unifill.Unifill;
import unifill.CodePoint;

class Main {
  public static function main() : Void {
    trace("日本語".uLength()); // ==> 3
    trace("русский".uCharAt(5)); // ==> и
    trace("🍺".uCodePointAt(0).toInt()); // ==> 127866
    trace(new CodePoint(0x1F37B)); // ==> 🍻
    for (c in "♠♡♢♣".uIterator()) {
      trace(c);
      trace(c + 4);
    }
  }
}
```

## Iteration

You might write iteration such that:

```haxe
function f(s : String) : Void {
  for (i in s.uLength()) {
    trace(s.uCharAt(i));
  }
}
```

But `f(s)` has order of the square of the length of `s`.

Instead, you can use `uIterator` to let the function be more efficient:

```haxe
function f(s : String) : Void {
  for (c in s.uIterator()) {
    trace(c.toString());
  }
}
```

## InternalEncoding

For advanced usage, you can use `InternalEncoding`, which provides methods
treating variable-length encoding without considering which encoding form
is practically used.

These methods index by code units. That is, the value of
`InternalEncoding.charAt("эюя", 2)` varies depending the target environment:
UTF-8 environments (Haxe macro, C++, Neko, PHP) gives `"ю"` and UTF-16
environments (Flash, C#, Java, JavaScript) gives `"я"`.

`InternalEncoding.codePointWidthAt` tells the number of code units the code
point is consist of, so any platform gives `"ю"` for the following expression:

```haxe
InternalEncoding.charAt("эюя", InternalEncoding.codePointWidthAt("эюя", 0))
```
