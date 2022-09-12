import SwiftUI

struct MatchesView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    @State private var selectedTab: LikedTab = .likes
    
    enum LikedTab {
        case likes, topPicks
    }
    
    private var buttonText: String {
        return selectedTab == .likes ? "See who likes you" : "Unlock Top Picks"
    }
    
    private func buttonAction() {
        appState.showPurchaseScreen()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Button {
                        selectedTab = .likes
                    } label: {
                        Text("\(userManager.matches.count) Likes")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(.textPrimary)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button {
                        selectedTab = .topPicks
                    } label: {
                        Text("\(userManager.topPicks.count) Top Picks")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(.textPrimary)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical, 14)
                
                if selectedTab == .likes {
                    LikeView()
                } else {
                    TopPicksView()
                }
                
                Spacer()
            }
            
            Button {
                buttonAction()
            } label: {
                Text(buttonText)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 36)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(30)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 40)
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
