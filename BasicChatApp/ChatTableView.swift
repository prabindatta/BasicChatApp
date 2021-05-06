//
//  ChatTableView.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 07/04/21.
//

import UIKit

class ChatTableView: UITableView {

    private let chatDataSource = ChatMessagesDataSource()
    
    lazy var viewModel: ChatViewModel = {
        let viewModel = ChatViewModel(dataSource: self.chatDataSource)
        return viewModel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    func setUp() {
        self.dataSource = self.chatDataSource
        
        self.chatDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            guard let self = self else { return }
            let lastIndex = self.chatDataSource.data.value.count - 1
            if lastIndex < 0 {
                self.reloadData()
            } else {
                let pathToLastRow = IndexPath(row: lastIndex, section: 0)
                self.hackAgainstJumping {
                    self.insertRows(at: [pathToLastRow], with: .fade)
                    self.scrollToRow(at: pathToLastRow, at: .bottom, animated: true)
                }
            }
        }
    }
}

extension ChatTableView {
  func hackAgainstJumping(_ block: () -> Void) {
      self.contentInset.bottom = 300
      block()
      self.contentInset.bottom = 0
  }
}
