import SwiftUI

public extension View {

  @inlinable func keyboardFrameProvider() -> some View {
    modifier(KeyboardFrameProviderModifier())
  }

  @inlinable func keyboardAware() -> some View {
    modifier(KeyboardAwareModifier())
  }
}
