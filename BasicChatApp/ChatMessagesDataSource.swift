//
//  ChatMessagesDataSource.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 07/04/21.
//

import UIKit

enum ChatMessage {
    case agent(message: String)
    case user(message: String)
}

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class ChatMessagesDataSource: GenericDataSource<ChatMessage>, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = self.data.value[indexPath.row]
        
        switch message {
        case .agent(let agentMessage):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AgentCell", for: indexPath) as? AgentBubbleCell else {
                fatalError("UserCell not found")
            }
            print("Agent Message: \(agentMessage)")
            cell.agentMessage = agentMessage
            return cell
        case .user(let userMessage):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserBubbleCell else {
                fatalError("UserCell not found")
            }
            cell.userMessage = userMessage
            return cell
        }
    }
}
