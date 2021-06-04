//
//  UITextField2.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-21.
//

import Foundation
import UIKit


extension UITextField {
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
            
        }
        set(hasDone){
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        self.resignFirstResponder()
    }
}

extension UITextField {
    @IBInspectable var clearAccessory: Bool{
        get{
            return self.clearAccessory
            
        }
        set(hasDone){
            if hasDone{
                addClearButtonOnKeyboard()
            }
        }
    }
    func addClearButtonOnKeyboard()
    {

        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
            let clear = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clikedClear))
            let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            toolbar.setItems([clear, spaceBtn], animated: true)
        self.inputAccessoryView = toolbar
    }
    @objc func clikedClear(){
        self.text = ""
        self.resignFirstResponder()
    }
    
    func sharedInit(title: String) {
        font = UIFont
            .preferredFont(forTextStyle: .headline)
        placeholder = title
        adjustsFontSizeToFitWidth = true
        textAlignment = .center
        textColor = .placeholderText
        adjustsFontForContentSizeCategory = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
