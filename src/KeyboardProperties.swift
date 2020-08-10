import Foundation
import UIKit
import CoreGraphics
import Combine

class KeyboardProperties: ObservableObject {
  
  static let shared = KeyboardProperties()
  
  @Published var frame = CGRect.zero

  var subscription: Cancellable?

  init() {
    // From Apple docs: The rectangle contained in the UIKeyboardFrameBeginUserInfoKey and UIKeyboardFrameEndUserInfoKey properties of the userInfo dictionary should be used only for the size information it contains. Do not use the origin of the rectangle (which is always {0.0, 0.0}) in rectangle-intersection operations. Because the keyboard is animated into position, the actual bounding rectangle of the keyboard changes over time.

    subscription = NotificationCenter.default
    .publisher(for: UIResponder.keyboardDidShowNotification)
    .merge(
      with: NotificationCenter.default.publisher(for: UIResponder.keyboardDidChangeFrameNotification)
    )
    .compactMap { $0.userInfo }
    .compactMap {
      $0[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
    }
    .merge(
      with: NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification).map { _ in
        CGRect.zero
      }
    )
    .assign(to: \.frame, on: self)
  }
  
  deinit {
    subscription?.cancel()
  }
}
