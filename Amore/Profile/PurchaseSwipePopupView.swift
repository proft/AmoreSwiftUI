import SwiftUI

struct PurchaseSwipePopupView: View {
    var body: some View {
        TabView {
            VStack(spacing: 10) {
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                Text("25 people already like you")
                    .font(.system(size: 18, weight: .semibold))
                Text("Match with them instantly")
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PurchaseSwipePopupView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePopupView()
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}
