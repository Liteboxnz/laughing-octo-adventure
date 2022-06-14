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
        
        guard let firstReplacementIndex = firstReplacementIndex else {
            return "\(kanji)[\(hiragana)]"

        }
            
        let lastKanjiChar = kanji[firstReplacementIndex]
        
        var firstHiraganaIndex = -1
        
        for (charIndex, hChar) in hiragana.enumerated() {
            
            // If it contains Kanji it can't replace at 0 position
            if charIndex > 0 && hChar == lastKanjiChar {
                firstHiraganaIndex = charIndex
            }
        }
        
        guard firstHiraganaIndex > -1 else {
            return "\(kanji)[\(hiragana)]"
        }
        
        let hiraganaIndex = hiragana.index(hiragana.startIndex, offsetBy: firstHiraganaIndex)

        let prefixString = "\(kanji[..<firstReplacementIndex])"
        let middleString = "\(hiragana[..<hiraganaIndex])"
        let suffixString = "\(kanji[firstReplacementIndex...])"

        // If there is further kanji use recursion to apply furigana
        if suffixString.containsKanji {
                
            let startOfNewKanjiString = String(kanji[firstReplacementIndex...])
            let startOfNewHiraganaString = String(hiragana[hiraganaIndex...])
            
            // If need to recursively break down multiple parts
            if let suffixKanaOffset = startOfNewKanjiString.firstIndex(where: { char in
                String(char).containsKanji
            }) {
                
                let croppedKanjiString = String(startOfNewKanjiString[suffixKanaOffset...])
                let croppedHiraganaString = String(startOfNewHiraganaString[suffixKanaOffset...])
                
                // Any kana until next Kanji
                let offsetString = String(startOfNewKanjiString[..<suffixKanaOffset])

                
                let replacementSuffixString = formattedString(fromKanji: croppedKanjiString,
                                                              andHiragana: croppedHiraganaString)
                
                
                return "\(prefixString)[\(middleString)]\(offsetString)\(replacementSuffixString)"
            }
                
            return "\(prefixString)[\(middleString)]\(suffixString)"
            
        } else {
            return "\(prefixString)[\(middleString)]\(suffixString)"
        }
    }
}
