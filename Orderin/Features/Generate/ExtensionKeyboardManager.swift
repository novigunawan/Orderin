//
//  ExtensionKeyboardManager.swift
//  Orderin
//
//  Created by Pieter Yonathan on 05/11/21.
//

import Foundation
import UIKit

extension GenerateQRViewController{

// auto adjust keyboard and view
@objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
}

@objc func keyboardWillHide(notification: NSNotification) {
    if self.view.frame.origin.y != 0 {
        self.view.frame.origin.y = 0
    }
}

//dismiss keyboard when tap in outside keyboard
func dismissKeyboard() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:self, action:    #selector(GenerateQRViewController.dismissKeyboardTouchOutside))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
}

@objc private func dismissKeyboardTouchOutside() {
    view.endEditing(true)
}
}
