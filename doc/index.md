**KeyboardSupport** documentation

# Obtaining keyboard dimensions

Initialize the environment.

```swift
KeyboardHeightDisplay().keyboardFrameProvider()
```

Access the keyboard frame via the environment using the key `keyboardFrame`.

```swift
struct KeyboardHeightDisplay: View {

  @Environment(\.keyboardFrame) var keyboardFrame

  var body: some View {
    Text("Current keyboard height: \(keyboardFrame.size.height)")
  }
}
```

# Making a view keyboard-aware

Simply apply the `keyboardAware` modifier and the view will automatically reposition when the keyboard becomes visible.

```swift
TextField("Keyboard-Aware Text Field", text: $value)
.keyboardAware()
```
