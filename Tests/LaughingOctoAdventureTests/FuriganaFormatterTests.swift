import XCTest
@testable import LaughingOctoAdventure

final class FuriganaFormatterTests: XCTestCase {
    
    func testGivenAnExampleStringWithNoKanaSuffixThenTheFuriganaIsFormattedCorrectly() throws {

        // Given
        let kanji = "休学"
        let hiragana = "きゅうがく"
        
        let formatter = ConcreteFuriganaFormatter()

        // When
        let result = formatter.formattedString(fromKanji: kanji, andHiragana: hiragana)
        
        // Then
        XCTAssertEqual(result, "休学[きゅうがく]")
    }
    
    func testGivenAnExampleStringWithSingleKanaSuffixThenTheFuriganaisFormattedCorrectly() throws {
        
        // Given
        let kanji = "誰でも"
        let hiragana = "だれでも"
        
        let formatter = ConcreteFuriganaFormatter()

        // When
        let result = formatter.formattedString(fromKanji: kanji, andHiragana: hiragana)
        
        // Then
        XCTAssertEqual(result, "誰[だれ]でも")
    }
}
