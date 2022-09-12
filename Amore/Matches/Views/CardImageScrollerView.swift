import SwiftUI
import Kingfisher

struct CardImageScrollerView: View {
    var person: Person
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    @State private var imageIndex = 0
    @Binding var fullScreenMode: Bool
    
    func updateImageIndex(addition: Bool) {
        let newIndex = addition ? imageIndex + 1 : imageIndex - 1
        imageIndex = min(max(0, newIndex), person.imageURLS.count - 1)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder { Color.white }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Image(systemName: "hand.thumbsup.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .foregroundColor(.green)
                                .opacity(Double(person.x / screenCutoff) - 1)
                            Spacer()
                            Image(systemName: "hand.thumbsdown.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .foregroundColor(.red)
                                .opacity(Double(person.x / screenCutoff * -1 - 1))
                        }
                        .padding(.top, 20)
                        Spacer()
                    }
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                }
                
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLS.count) { imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, fullScreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullScreenMode {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .light))
                                }
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            Spacer()
                            Button {
                                fullScreenMode = true
                            } label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                            }
                        }
                        .padding(16)
                    }
                }
                .foregroundColor(Color.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScrollerView(person: Person.example, fullScreenMode: .constant(false))
    }
}
