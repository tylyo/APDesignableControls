//
//  APTextField.swift
//  EasyReceipts
//
//  Created by Attilio Patania on 15/12/14.
//  Copyright (c) 2014 Attilio Patania. All rights reserved.
//

import UIKit

    @IBDesignable class APTextField: UITextField, UITextFieldDelegate {

        @IBInspectable var maxLenght:Int = 30

        required init(coder  aDecoder: NSCoder) {

            super.init(coder: aDecoder)
           setup()

        }
        
        func setup(){
            self.clearButtonMode = UITextFieldViewMode.WhileEditing
            self.autocapitalizationType = UITextAutocapitalizationType.Words
            
            self.returnKeyType = .Done
            self.enablesReturnKeyAutomatically = true
            if self.conformsToProtocol(UITextFieldDelegate){
                self.delegate = self
            }
            //        background = UIImage(named: "txt_bg.png")
            self.borderStyle = .None
        }
        
        func checkMaxLenght(string:String, range:NSRange) -> Bool {
            var  newLength = countElements(self.text) + countElements(string) - range.length
            return (newLength <= maxLenght)
        }
        
        func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            return self.checkMaxLenght(string, range: range)
        }
        func textFieldShouldEndEditing(textField: UITextField) -> Bool {
            self.toolBarDoneAction()

            return true
        }
        
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            self.toolBarDoneAction()
            return true
        }
        
        override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
            return false
        }

        func toolBarCancelAction() -> Void {
            self.resignFirstResponder()

        }
        func toolBarDoneAction() -> Void {
            self.resignFirstResponder()
            
        }

        func useToolBar(cancelAction:() -> Void , doneAction: () -> Void ){
        }
    }
