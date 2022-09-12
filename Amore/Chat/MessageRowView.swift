import SwiftUI
import Kingfisher

struct MessageRowView: View {
    var preview: MessagePreview
    
    var body: some View {
        HStack {
            RoundImage(url: preview.person.imageURLS.first)
                .frame(height: 90)
            VStack(alignment: .leading, spacing: 8) {
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}
