[![GitHub License](https://img.shields.io/github/license/XCEssentials/OptionalAssign.svg?longCache=true)](LICENSE)
[![GitHub Tag](https://img.shields.io/github/tag/XCEssentials/OptionalAssign.svg?longCache=true)](https://github.com/XCEssentials/OptionalAssign/tags)
[![Swift Package Manager Compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?longCache=true)](Package.swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?longCache=true)](https://github.com/Carthage/Carthage)
[![Written in Swift](https://img.shields.io/badge/Swift-5.0-orange.svg?longCache=true)](https://swift.org)
[![Supported platforms](https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux-blue.svg?longCache=true)](Package.swift)
[![Build Status](https://travis-ci.com/XCEssentials/OptionalAssign.svg?branch=master)](https://travis-ci.com/XCEssentials/OptionalAssign)

# OptionalAssign

Custom assign operator that safely unwraps optionals and preserves existing value of the receiver (expression on the left side) unchanged, if the optional on the right side does not have a value (i.e. equal to `nil`).

# When to use

Use this operator in these cases:
- to safely assign a regular optional value, only if it has non-`nil` value (otherwise operator will do nothing);
- to safely assign an implicitly unwrapped optional value, only if it has non-`nil` value (otherwise operator will do nothing).

**BONUS**: the value on the right will be automatically converted to receiver type before assign, so no need to cast explicitly.

# How to use

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
title ?= aDict["title"]
```

See unit tests for more examples.
