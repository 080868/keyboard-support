import XCTest
import SwiftUI
import SwiftUILib_KeyboardSupport

final class KeyboardSupportTests: XCTestCase {
  func testKeyboardAware() {
    _ = EmptyView().keyboardAware()
  }
  
  func testKeyboardFrameProvider() {
    _ = EmptyView().keyboardFrameProvider()
  }
}
