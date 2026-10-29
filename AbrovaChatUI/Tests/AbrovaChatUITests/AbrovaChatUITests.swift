import XCTest
@testable import AbrovaChatUI

final class AbrovaChatUITests: XCTestCase {
    func testColorsDefaultValues() {
        let colors = AbrovaChatColors()
        XCTAssertNotNil(colors.myMessageBubble)
        XCTAssertNotNil(colors.otherMessageBubble)
    }
    
    func testDimensionsDefaultValues() {
        let dimensions = AbrovaChatDimensions()
        XCTAssertEqual(dimensions.messageBubbleRadius, 16)
        XCTAssertEqual(dimensions.avatarSize, 40)
    }
}
