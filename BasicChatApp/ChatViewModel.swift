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
        
        if Bool.random() {
            let userMessage = ChatMessage.user(message: message)
            self.dataSource?.data.value.append(userMessage)
        } else {
            let agentMessage = ChatMessage.agent(message: message)
            self.dataSource?.data.value.append(agentMessage)
        }
    }
}
