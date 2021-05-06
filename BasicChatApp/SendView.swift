//
//  SendView.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 07/04/21.
//

import UIKit

protocol SendViewDelegate: class {
    func send(userMessage: String)
}

class SendView: UIView {

    @IBOutlet private weak var messageTextView: UITextView!
    @IBOutlet private weak var textViewHeightConstraint: NSLayoutConstraint!
    
    weak var delegate: SendViewDelegate?
    
    @IBAction private func sendMessage() {
        let message = self.messageTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        self.delegate?.send(userMessage: message)
        
    }
}

extension SendView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let textViewHeight = max(self.messageTextView.sizeThatFits(self.messageTextView.bounds.size).height, 44.0)
        let numLines = (self.messageTextView.contentSize.height / CGFloat(self.messageTextView.font?.lineHeight ?? 0.0))
        guard numLines < 5 else { return }
//        Logger().debug("numLines: \(numLines)")
        self.textViewHeightConstraint.constant = textViewHeight
    }
}
