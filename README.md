# ShortHandAlert :memo: :dash:

A very simple extension of UIAlertController for shortening your source.

---

## Why

Hmmmm... I want to display Alert or ActionSheet to users. Let's write the code immediately.

```swift
let alert = UIAlertController(title: "title", message: nil, preferredStyle: .actionSheet)

// I want...

// How many times have you written this UIAlertAction in your whole life? 😭😭
 alert.addAction(UIAlertAction(title: "Some", style: .default, handler: { _ in
     print("do some thing...")
 }))

 alert.addAction(UIAlertAction(title: "Another", style: .default, handler: { _ in
     print("do some thing...")
 }))

 //              ↓ Why do I have to write UIAlertAction many times? 😱😱
 alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

 present(alert, animated: true)
```

From today you can write shorter. 🤣

## Usage

### Action Sheet

```swift
// Without action handler.
UIAlertController(title: "Title", message: nil, preferredStyle: .actionSheet)
    .default(".default style title")
    .destructive(".destructive style title")
    .cancel()
    .present(in: self)

// With action handler.
UIAlertController(title: "Title", message: nil, preferredStyle: .actionSheet)
    .default(".default style title") { _ in
        print("select default")
    }.destructive(".destructive style title") { _ in
        print("select destructive")
    }.cancel("custom cancel title") { _ in
        print("select cancel")
    }.present(in: self, animated: false) { // custom present behavior.
        print("do some thing after the presentation finishes.")
    }

```
### Alert

```swift

 // Without action handler.
UIAlertController(title: "Alert title", message: nil, preferredStyle: .alert)
    .ok()
    .cancel()
    .present(in: self)

// With action handler and text field.
UIAlertController(title: "Alert title", message: "some message.", preferredStyle: .alert)
     // Add TextField with default text and placeholder.
    .textField("default text", placeholder: "placeholder")
    // add custom button.
    .default("(っ＞ω＜c)") { (_, textFields) in
        print("do some thing with", textFields?.first?.text ?? "")
    }
    // add cancel button.
    .cancel()
    .present(in: self)
```

## Requirements

- iOS 9.3+
- Support Swift 4+ & Objective-C

## Installation

### Using Carthage

Add `github "mironal/ShortHandAlert` to you Cartfile.

```
github "mironal/ShortHandAlert"
```

## Demo

### for Swift

see `/Demo` directory.

### for Objective-c

see `/DemoObjc` directory.
