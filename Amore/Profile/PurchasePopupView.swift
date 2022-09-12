import SwiftUI

struct PurchasePopupView: View {
    @Binding var isVisible: Bool
    
    @State private var selectedIndex: Int = 1
    
    let screen = UIScreen.main.bounds
    
    let subscriptions: [Subscription] = [
        Subscription.example1,
        Subscription.example2,
        Subscription.example3
    ]
    
    func processPayment() {}
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height: 40)
                
                VStack {
                    Text("Get Amore Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    
                    PurchaseSwipePopupView()
                        .frame(height: geo.size.height / 3)
                        .padding(.top, -35)
                    
                    HStack {
                        ForEach(subscriptions.indices) { subIndex in
                            let sub =  subscriptions[subIndex]
                            PurchaseOptionView(subscription: sub, isSelected: subIndex == selectedIndex)
                                .onTapGesture {
                                    selectedIndex = subIndex
                                }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        processPayment()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            Text("Continue")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    }
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    Button {
                        isVisible = false
                    } label: {
                        Text("No Thanks")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20, weight: .heavy))
                    }
                    .padding(.vertical, 18)
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 25, style: .continuous).foregroundColor(.white))
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Recurring billing, cancel anytime.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("Description.")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopupView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopupView(isVisible: .constant(false))
            .frame(width: 200)
    }
}
