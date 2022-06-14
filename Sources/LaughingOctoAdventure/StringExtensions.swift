internal extension String {
    
    private enum Constants {
        static let validKanjiRegex = "[\u{3400}-\u{4dbf}\u{4e00}-\u{9fff}]"
        
        static let validHiraganaRegex = "[\u{3040}-\u{30FF}]"
    }
    
    var containsKanji: Bool {
        return self.range(of: Constants.validKanjiRegex,
                          options: String.CompareOptions.regularExpression) != nil
    }
    
    var containsHiragana: Bool {
        return self.range(of: Constants.validHiraganaRegex,
                          options: String.CompareOptions.regularExpression) != nil
    }
}
