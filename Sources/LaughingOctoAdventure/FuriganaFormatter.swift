import Foundation

public protocol FuriganaFormatter {
    func formattedString(fromKanji: String, andHiragana: String) -> String
}

public class ConcreteFuriganaFormatter {
    
    public init() {}
    
    public func formattedString(fromKanji kanji: String, andHiragana hiragana: String) -> String {
        
        if kanji.isEmpty || kanji == hiragana {
            return hiragana
        }
        
        if hiragana.isEmpty {
            return kanji
        }
        
        let firstReplacementIndex = kanji.firstIndex { char in
            String(char).containsHiragana
        }
        
        if let firstReplacementIndex = firstReplacementIndex {
            
            let lastKanjiChar = kanji[firstReplacementIndex]
            
            let hiraganaPrefix = hiragana.firstIndex { char in
                char == lastKanjiChar
            }
            
            if let hiraganaPrefix = hiraganaPrefix {
                
                let prefixString = "\(kanji[..<firstReplacementIndex])"
                let middleString = "\(hiragana[..<hiraganaPrefix])"
                let suffixString = "\(kanji[firstReplacementIndex...])"
        
                return "\(prefixString)[\(middleString)]\(suffixString)"
            }
            
        }
        
        // Basic implementation for test to pass
        return "\(kanji)[\(hiragana)]"
    }
}
