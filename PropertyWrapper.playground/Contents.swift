import UIKit

class CodingStyleClass {
    @CodingStyle(key: .kebab) var kebabString = ""
    @CodingStyle(key: .snake) var snakeString = ""
    @CodingStyle(key: .camel) var camelString = ""
}

enum Styles {
    case camel
    case snake
    case kebab
}

@propertyWrapper
struct CodingStyle<Value: StringProtocol> {
    private var value: Value
    private var key: Styles
    
    init(wrappedValue: Value, key: Styles) {
        self.value = wrappedValue
        self.key = key
    }
    
    private func get() -> Value {
        return value
    }
    
    private mutating func set(_ newValue: Value){
        switch self.key {
        case .camel:
            let convertedValue = newValue.lowercased()
                .split(separator: " ")
                .map { String($0) }
                .enumerated()
                .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
                .joined() as! Value
            value = convertedValue
            print("Преобразование \(newValue) в  \(convertedValue) по шаблону 'camelCase'")
        case .kebab:
            let convertedValue = newValue.lowercased().replacingOccurrences(of: "[\\s_]", with: "-", options: .regularExpression) as! Value
            value = convertedValue
            print("Преобразование \(newValue) в \(convertedValue) по шаблону 'kebabCase'")
        case .snake:
            let convertedValue = newValue.lowercased().replacingOccurrences(of: "[\\s-]", with: "_", options: .regularExpression) as! Value
            value = convertedValue
            print("Преобразование \(newValue) в \(convertedValue) по шаблону 'snakeCase'")
        }
    }
    
    public var wrappedValue: Value {
        get {
            get()
        }
        set {
            set(newValue)
        }
    }
}


CodingStyleClass().kebabString = "test test"
CodingStyleClass().snakeString = "test-Test"
CodingStyleClass().camelString = "test test"

