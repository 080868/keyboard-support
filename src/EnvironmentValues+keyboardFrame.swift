import SwiftUI

public extension EnvironmentValues {

  private struct Key: EnvironmentKey {
    static let defaultValue = KeyboardProperties.shared.frame
  }

  internal(set) var keyboardFrame: CGRect {
    get { self[Key.self] }
    set { self[Key.self] = newValue }
  }
}
