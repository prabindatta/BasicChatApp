//
//  ChatViewController.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 05/04/21.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet private weak var chatTableView: ChatTableView!
    @IBOutlet private weak var sendView: SendView! {
        didSet {
            self.sendView.delegate = self
        }
    }
    
    var screenTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = screenTitle
    }
}

extension ChatViewController: SendViewDelegate {
    
    func send(userMessage: String) {
        self.chatTableView.viewModel.add(message: userMessage)
    }
}
