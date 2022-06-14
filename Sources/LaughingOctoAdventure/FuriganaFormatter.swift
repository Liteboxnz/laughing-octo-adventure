import Foundation

protocol FuriganaFormatter {
    func formattedString(fromKanji: String, andHiragana: String) -> String
}

class ConcreteFuriganaFormatter {
    func formattedString(fromKanji kanji: String, andHiragana hiragana: String) -> String {
        
        // Basic implementation for test to pass
        return "\(kanji)[\(hiragana)]"
    }
}
