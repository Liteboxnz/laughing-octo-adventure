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
            
            var middlePrefix = -1
            
            for (charIndex, hChar) in hiragana.enumerated() {
                
                // If it contains Kanji it can't replace at 0 position
                if charIndex > 0 && hChar == lastKanjiChar {
                    middlePrefix = charIndex
                }
            }
            
            if middlePrefix > -1 {
                
                let hiraganaIndex = hiragana.index(hiragana.startIndex, offsetBy: middlePrefix)

                let prefixString = "\(kanji[..<firstReplacementIndex])"
                let middleString = "\(hiragana[..<hiraganaIndex])"
                let suffixString = "\(kanji[firstReplacementIndex...])"
        
                return "\(prefixString)[\(middleString)]\(suffixString)"
            }
            
        }
        
        // Basic implementation for test to pass
        return "\(kanji)[\(hiragana)]"
    }
}
