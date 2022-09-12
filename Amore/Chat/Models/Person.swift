import SwiftUI

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var imageURLS: [URL]
    var bio: String
    var bioLong: String
    var distance: Int
    var age: Int
    
    // Used for card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: CGFloat = 0.0
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!, URL(string: "https://picsum.photos/400/301")!, URL(string: "https://picsum.photos/400/302")!, URL(string: "https://picsum.photos/400/303")!],
        bio: "Some bio",
        bioLong: "Some long bio",
        distance: 40,
        age: 19)
    
    static let example2 = Person(
        name: "Samantha",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "Some bio",
        bioLong: "Some long bio",
        distance: 18,
        age: 28)
    
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person(name: "John",
               imageURLS: [URL(string: "https://picsum.photos/400/302")!],
               bio: "I love racing",
               bioLong: "Some long bio",
               distance: 57,
               age: 40),
        Person(name: "Sophia",
               imageURLS: [URL(string: "https://picsum.photos/400/303")!],
               bio: "I love cooking",
               bioLong: "Some long bio",
               distance: 31,
               age: 24)
    ]
    
}
