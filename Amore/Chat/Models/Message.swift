import Foundation

struct Message: Hashable {
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hello")
    static let exampleRecieved = Message(content: "Hello", person: Person.example)
}

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello")
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Message 1"),
        MessagePreview(person: Person.example, lastMessage: "Message 2"),
    ]
}
