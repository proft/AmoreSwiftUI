import SwiftUI

struct ChatHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    let imageUrl: URL?
    let videoAcition: () -> Void
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.top).shadow(radius: 3)
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size: 28, weight: .semibold))
                })
                
                Spacer()
                
                VStack(spacing: 7) {
                    RoundImage(url: imageUrl)
                        .frame(height: 50)
                    
                    Text(name).foregroundColor(Color.textSecondary)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Button(action: { videoAcition() }) {
                    Image(systemName: "video.fill")
                        .font(.system(size: 20, weight: .bold))
                }
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
        .frame(height: 70)
    }
}

struct ChatHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.example
        ChatHeaderView(name: person.name, imageUrl: person.imageURLS.first, videoAcition: {})
    }
}
