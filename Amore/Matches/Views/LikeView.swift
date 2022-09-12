import SwiftUI

struct LikeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User {
        userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to Gold to see people who already liked you.")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center) {
                    ForEach(userManager.matches) { person in
                        PersonSquareView(person: person, blur: !user.goldSubscriber)
                            .frame(height: 240)
                            .onTapGesture {
                                personTapped(person)
                            }
                    }
                }
                .padding(.horizontal, 6)
        }
    }
    
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appState.showPersonProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
