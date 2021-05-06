//
//  UserBubbleCell.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 07/04/21.
//

import UIKit

class UserBubbleCell: UITableViewCell {

    @IBOutlet private weak var userMessageLabel: UILabel!
    
    var userMessage: String? {
        didSet {
            self.userMessageLabel.text = self.userMessage
        }
    }

}
