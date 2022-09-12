import Foundation

struct User {
    var name: String
    var age: Int
    var jobTitle: String
    var imageURLS: [URL] = []
    var goldSubscriber: Bool = false
    var profileTip: String = ""
}

extension User {
    static let example = User(name: "Alex",
                              age: 28,
                              jobTitle: "Worker", imageURLS: [URL(string: "https://picsum.photos/400/310")!], goldSubscriber: true, profileTip: "Photo tip")
}
