//
//  ContentView.swift
//  firechat
//
//  Created by rt on 01/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id){
                            message in MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 20)
                    .background(.white)
                .cornerRadius(30,corners: [.topLeft, .topRight])
                .onChange(of: messagesManager.lastMessage) { newValue in
                    withAnimation {
                        proxy.scrollTo(newValue, anchor: .bottom)                    }
                    
                }
                }
            }
            .background(Color("Peach"))
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
