import SwiftUI

@usableFromInline struct KeyboardAwareModifier: ViewModifier {

  @ObservedObject var keyboardProps = KeyboardProperties.shared

  @usableFromInline init() {}

  @usableFromInline func body(content: Content) -> some View {
    content
    .offset(y: -keyboardProps.frame.size.height)
    .animation(.easeIn(duration: 0.2))
  }
}


struct KeyboardAwareModifier_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Spacer()
      TextField("Keyboard-Aware Text Field", text: .constant(""))
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .modifier(KeyboardAwareModifier())
    }
    .padding()
  }
}
