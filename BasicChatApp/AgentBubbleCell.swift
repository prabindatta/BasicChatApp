//
//  AgentBubbleCell.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 08/04/21.
//

import UIKit

class AgentBubbleCell: UITableViewCell {

    @IBOutlet private weak var agentMessageLabel: UILabel!
    
    var agentMessage: String? {
        didSet {
            self.agentMessageLabel.text = self.agentMessage
        }
    }
}
