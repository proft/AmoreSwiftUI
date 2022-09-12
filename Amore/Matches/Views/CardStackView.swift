import SwiftUI

struct CardStackView: View {
    @State private var fullscreenMode: Bool = false
    var people: [Person]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullScreenMode: $fullscreenMode)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(people: Person.examples)
    }
}
