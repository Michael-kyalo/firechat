//
//  MessagesManager.swift
//  firechat
//
//  Created by rt on 01/08/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessage = ""
    
    let db = Firestore.firestore()
    init() {
        getMessages()
    }
    func getMessages(){
        db.collection("messages").addSnapshotListener { querrySnapshot, error in
            guard let documents = querrySnapshot?.documents else {
                print("error fetching docs: \(String(describing: error))")
                return
            }
            
            self.messages =  documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                }
                catch{
                    print("error parsing docs: \(String(describing: error))")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp}
            if let id =  self.messages.last?.id{
                self.lastMessage = id
            }
        }
    }
    func  sendMessage(text:String)  {
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
            
        }catch{
            print("error sending message: \(String(describing: error))")

        }
    }
}
