import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListViewModel = MessageListViewModel()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    TextField("Search Matches", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textFieldBg)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.textPrimary)
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(.leading, 4)
                                Spacer()
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .animation(.easeIn(duration: 0.25))
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.searchText = ""
                            self.endEditing(true)
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.25))
                    }
                }
                
                Spacer().frame(height: 14)
                
                ZStack {
                    VStack {
                        ForEach(vm.messagePreviews.filter({ filter($0) }), id: \.self) { preview in
                            NavigationLink(destination: ChatView(person: preview.person), label: {
                                MessageRowView(preview: preview)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .animation(.easeIn(duration: 0.25))
                            .transition(.slide)
                        }
                    }
                    
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                }
                
                Spacer()
            }
        }
        
    }
    
    func filter(_ preview: MessagePreview) -> Bool {
        if searchText.isEmpty { return true }
        if preview.person.name.contains(searchText) { return true }
        if preview.lastMessage.contains(searchText) { return true }
        if preview.person.bio.contains(searchText) { return true }
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
