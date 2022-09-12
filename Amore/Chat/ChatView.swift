import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    
    @State private var typingMessage: String = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 80)
                
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        LazyVStack {
                            ForEach(chatManager.messages.indices, id: \.self) { index in
                                let msg = chatManager.messages[index]
                                MessageView(message: msg)
                                    .id(index)
                                    .animation(.easeIn)
                                    .transition(.move(edge: .trailing))
                            }
                        }
                        .onAppear {
                            scrollProxy = proxy
                        }
                    }
                }
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBg
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button(action: { sendMessage() }) {
                        Text("Send")
                    }
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            ChatHeaderView(name: person.name, imageUrl: person.imageURLS.first) {
                // Video action
            }
        }
        .modifier(HideNavigationView())
        .onChange(of: chatManager.keyboardIsShowing) { newValue in
            if newValue {
                scrollToBottom()
            }
        }
        .onChange(of: chatManager.messages) { _ in
            scrollToBottom()
        }
    }
    
    func sendMessage() {
        chatManager.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatManager.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
