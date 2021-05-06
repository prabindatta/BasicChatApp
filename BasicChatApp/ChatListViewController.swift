//
//  ChatListViewController.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 07/04/21.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet private weak var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chats"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChatScreenIdentifier" {
            let chatViewController = segue.destination as? ChatViewController
            chatViewController?.screenTitle = "Test"
        }
    }
    
    @IBAction private func addChatContact() {
        self.performSegue(withIdentifier: "ChatScreenIdentifier", sender: self)
    }
}
