import SwiftUI

@usableFromInline struct KeyboardFrameProviderModifier: ViewModifier {

  @ObservedObject var keyboardProps = KeyboardProperties.shared

  @usableFromInline init() {}

  @usableFromInline func body(content: Content) -> some View {
    content
    .environment(\.keyboardFrame, keyboardProps.frame)
  }
}

struct KeyboardFrameProviderModifier_Previews: PreviewProvider {

  struct HeightDisplay: View {

    @Environment(\.keyboardFrame) var keyboardFrame

    var body: some View {
      Text("Keyboard height: \(keyboardFrame.size.height)")
    }
  }

  static var previews: some View {
    HeightDisplay()
    .modifier(KeyboardFrameProviderModifier())
    .previewLayout(.sizeThatFits)
  }
}
