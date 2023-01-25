import Foundation

let lowerCase = "abcdefghijklmnopqrstuvwxyz"
let upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let numbers = "0123456789"
let lettersAndNumbers = lowerCase+upperCase+numbers
let special = "*.!@#$%^&(){}[]:;<>,.?/~+-=|\\"

let isLoggingEnabled = false
func log(_ msg: String) {
    if isLoggingEnabled {
        print(msg)
    }
}

extension String {
func randomIndex() -> String.Index {
    return self.index(startIndex, offsetBy: Int.random(in: 0..<count))
}
    
func matches(_ regex: String) -> Bool {
    return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
}
} // extension String

func randomString(length: Int, seed: String) -> String {
    return String((0..<length).map{ _ in seed.randomElement()! })
}

func insertAtRandomPosition(_ character: Character, _ str: String) -> String {
    var strCpy = str
    strCpy.insert(character, at: strCpy.randomIndex())
    return strCpy
}

func insertSpecialCharacters(str: String) -> String {
    var strCpy = str
    
    var letterCtr = 0
    var indiciesToInsertSpecialCharacters: Array<Int> = []
    
    log("Original password \(strCpy)")
    strCpy.enumerated().forEach {
        if $0.1.isLetter { letterCtr+=1 }
        else             { letterCtr=0 }

        if (letterCtr >= 2) {
            log("2 consecutive letters detected")
            letterCtr = 0
            indiciesToInsertSpecialCharacters.append($0.0)
        }
    }
    
    print("Inserting special characters at: \(indiciesToInsertSpecialCharacters)")
    var offsetDueToInsertingElements = 0
    indiciesToInsertSpecialCharacters.forEach {
        let offset = $0+offsetDueToInsertingElements
        log("password before insert \(strCpy)")
        strCpy.insert(special.randomElement()!, at: strCpy.index(str.startIndex, offsetBy: offset))
        offsetDueToInsertingElements+=1
    }
    
    return strCpy
}

func genPassword() -> String {
    let length = Int.random(in: 8...15)
    var pass = randomString(length: length, seed: lettersAndNumbers+special)

    if !pass.matches(".*[a-z].*") {
        log("Adding lowercase")
        pass = insertAtRandomPosition(lowerCase.randomElement()!, pass)
    }
    
    if !pass.matches(".*[A-Z].*") {
        log("Adding uppercase")
        pass = insertAtRandomPosition(upperCase.randomElement()!, pass)
    }
    
    if !pass.matches(".*[1-9].*") {
        log("Adding letter")
        pass = insertAtRandomPosition(numbers.randomElement()!, pass)
    }
    
    return insertSpecialCharacters(str: pass)
}

print(genPassword())
