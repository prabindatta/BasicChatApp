//
//  ChatViewModel.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 07/04/21.
//

import Foundation

struct ChatViewModel {
    
    weak var dataSource: GenericDataSource<ChatMessage>?
    
    init(dataSource: GenericDataSource<ChatMessage>?) {
        self.dataSource = dataSource
    }
    
    func add(message: String) {
        let userMessage = ChatMessage.user(message: message)
        let agentMessage = ChatMessage.user(message: message)
        
        if Bool.random() {
            self.dataSource?.data.value.append(userMessage)
        } else {
            self.dataSource?.data.value.append(agentMessage)
        }
    }
}
