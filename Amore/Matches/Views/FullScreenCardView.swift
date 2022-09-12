import SwiftUI

struct FullScreenCardView: View {
    var person: Person
    let screen = UIScreen.main.bounds
    var namespace: Namespace.ID
    
    @Binding var fullscreenMode: Bool
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    CardImageScrollerView(person: person, fullScreenMode: $fullscreenMode)
                        .frame(width: screen.width, height: screen.height * 0.6)
                        .matchedGeometryEffect(id: "image\(person.id)", in: namespace)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                Text(String(person.age))
                                    .font(.system(size: 28, weight: .light))
                                Spacer()
                            }
                            .opacity(0.75)
                            
                            Text("\(person.distance) miles away")
                                .font(.system(size: 18, weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal, .top], 16)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)
                        .offset(y: -40)
                    }
                    
                    Spacer().frame(height: 26)
                    
                    HStack {
                        Text(person.bio)
                            .font(.system(size: 18, weight: .medium))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: false)
                            .opacity(0.75)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    
                    Spacer().frame(height: 32)
                    
                    VStack(spacing: 24) {
                        Button {
                            showActionSheet()
                        } label: {
                            VStack(spacing: 8) {
                                Text("Share \(person.name.uppercased())'s profile")
                                    .font(.system(size: 16, weight: .medium))
                                Text("See what a friend thinks")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .opacity(0.9)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Report \(person.name.uppercased())")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                                .opacity(0.75)
                        }
                    }
                    
                    Spacer().frame(height: 100)
                }
            }
            
            HStack(spacing: 20) {
                Spacer()
                
                CircleButtonView(type: .no) {
                    fullscreenMode = false
                    userManager.swipe(person, .nope)
                }
                .frame(height: 50)
                
                CircleButtonView(type: .star) {
                    fullscreenMode = false
                    userManager.superLike(person)
                }
                .frame(height: 45)
                
                CircleButtonView(type: .heart) {
                    fullscreenMode = false
                    userManager.swipe(person, .like)
                }
                .frame(height: 50)
                
                Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 45)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top, 40)
    }
    
    func showActionSheet() {
        let items: [Any] = ["What do you think about \(person.name)? \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true)
    }
}

struct FullScreenCardView_Previews: PreviewProvider {
    @Namespace static var placeholder
    static var previews: some View {
        FullScreenCardView(person: Person.example, namespace: placeholder, fullscreenMode: .constant(true))
    }
}
