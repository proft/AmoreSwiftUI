import SwiftUI

struct PurchaseOptionView: View {
    var subscription: Subscription
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(subscription.month)")
                .font(.system(size: 44, weight: .light))
            
            Spacer().frame(height: 2)
            
            Text("month\(subscription.month > 1 ? "s" : "")")
                .if(isSelected) {
                    $0.font(.system(size: 14, weight: .bold))
                }
            
            Spacer().frame(height: 2)
            
            Text(subscription.costMonth)
                .foregroundColor(.textPrimary)
            
            Spacer().frame(height: 10)
            
            if let savePercent = subscription.savePercent {
                Text("SAVE \(savePercent)%")
                    .foregroundColor(.yellow)
                    .font(.system(size: 16, weight: .heavy))
                    .frame(height: 22)
            } else {
                Spacer().frame(height: 22)
            }
            
            Spacer().frame(height: 12)
            
            Text(subscription.costTotal)
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .if(!isSelected) {
            $0.foregroundColor(Color.textPrimary)
        }.if(isSelected && subscription.tagLine == .none) {
            $0.overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.yellow, lineWidth: 1.5)
            )
        }.if(isSelected && subscription.tagLine != .none) {
            $0.overlay(
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(height: 20)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                    Text(subscription.tagLine.rawValue)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.top, 2)
                        .padding(.horizontal, 6)
                        .minimumScaleFactor(0.1)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.yellow, lineWidth: 1.5)
                }
            )
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseOptionView(subscription: Subscription.example1, isSelected: true)
    }
}
