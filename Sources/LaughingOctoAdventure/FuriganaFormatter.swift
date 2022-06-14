import Foundation

public protocol FuriganaFormatter {
    func formattedString(fromKanji: String, andHiragana: String) -> String
}

public class ConcreteFuriganaFormatter {
    
    public init() {}
    
    public func formattedString(fromKanji kanji: String, andHiragana hiragana: String) -> String {
        
        // Basic implementation for test to pass
        return "\(kanji)[\(hiragana)]"
    }
}
