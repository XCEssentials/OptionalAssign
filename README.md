# MKHOptionalAssign

Custom assign operator that safely unwraps optionals and preserves existing value of the receiver (expression on the left side) unchanged, if the optional on the right side does not have a value (i.e. equal to `nil`).


When to use
=

Use this operator in these cases:
- to safely assign a regular optional value, only if it has non-`nil` value (otherwise operator will do nothing);
- to safely assign an implicitly unwrapped optional value, only if it has non-`nil` value (otherwise operator will do nothing).

BONUS: the value on the right will be automatically converted to receiver type before assign, so no need to cast explicitly.


How it works
=

Imagine you have a property that is required to always have a value, so you star with default value:


```swift
var title = 'Default value'
```

... and later you got a dictionary, that might have new value for the `title`:


```swift
let aDict: [String: AnyObject] = ... // maybe got from network?
```

This is how we can try to get new `title` value from the dictionary using standard Swift syntax:


```swift
if let newTitleValue = aDict["title"] as? String
{
    // yes it has a non-nil value
    title = newTitleValue
}
```

With optional assign operator you do the same with just this:

```swift
title ?= newTitleValue
```

See unit tests for more examples.

Swift 3
=

Starting from [version 2.0](https://github.com/maximkhatskevich/MKHOptionalAssign/releases/tag/2.0.0), this library supports Swift 3. For compatibility with Swift 2.2 and Swift 2.3 use [older version](https://github.com/maximkhatskevich/MKHOptionalAssign/releases/tag/1.0.0).