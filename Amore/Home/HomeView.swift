import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var user: User {
        return userManager.currentUser
    }

    var body: some View {
        VStack {
            CardStackView(people: userManager.cardPeople)

            Spacer()

            HStack {
                CircleButtonView(type: .back) {
                    appState.showPurchaseScreen()
                }
                Spacer()
                
                CircleButtonView(type: .no) {
                    if let person = userManager.cardPeople.last {
                        userManager.swipe(person, .nope)
                    }
                }
                Spacer()
                
                CircleButtonView(type: .star) {
                    if let person = userManager.cardPeople.last {
                        if userManager.currentUser.goldSubscriber {
                            userManager.superLike(person)
                        } else {
                            appState.showPurchaseScreen()
                        }
                    }
                }
                Spacer()
                
                CircleButtonView(type: .heart) {
                    if let person = userManager.cardPeople.last {
                        userManager.swipe(person, .like)
                    }
                }
                Spacer()
                
                CircleButtonView(type: .lightning) {
                    appState.showPurchaseScreen()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
