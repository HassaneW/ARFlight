//
//  CustomTextfield.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-20.
//

//import UIKit
//
//class CustomTextfield: UIView {
//    let view = UIView()
//
//    let textField = UITextField()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        sharedInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        sharedInit()
//    }
//    
//    private func sharedInit() {
//        
//        textField.delegate = self
//        textField.font = UIFont
//            .preferredFont(forTextStyle: .largeTitle)
//        textField.font = UIFont(name: "HelveticaNeue", size: 30)
//        textField.adjustsFontSizeToFitWidth = true
//        textField.textAlignment = .center
//        textField.textColor = .label
//        textField.adjustsFontForContentSizeCategory = true
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        
//        setUpTextField()
//        
//    }
//    func setUpTextField() {
////        moneyTextField.delegate = self
//        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
//        textField.inputAccessoryView = toolbar
//        addToolbar()
//    }
//    func addToolbar() {
//        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
//        let clear = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clikedClear))
//        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        toolbar.setItems([clear, spaceBtn], animated: true)
//        self.textField.inputAccessoryView = toolbar
//    }
//    @objc func clikedClear() {
//        textField.text = ""
//        textField.resignFirstResponder()
//    }
//}
//
//extension CustomTextfield: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(#function)
//        return true
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string == "." && (textField.text?.contains(".") == true) {
//            return false
//        }
//        return true
//    }
//}


/*
 Textfield :
 1)
 
 func setUpTextField() {
     moneyTextField.delegate = self
     let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
     moneyTextField.inputAccessoryView = toolbar
     addToolbar()
 }
 
 2)
 func addToolbar() {
     let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
     let clear = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clikedClear))
     let convert = UIBarButtonItem(title: "Convert", style: .plain, target: self, action: #selector(clikedConvert))
     let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
     toolbar.setItems([clear, spaceBtn, convert], animated: true)
     self.moneyTextField.inputAccessoryView = toolbar
 }
 @objc func clikedClear() {
     moneyTextField.text = ""
 }
 @objc func clikedConvert() {
     updateMoney()
     moneyTextField.resignFirstResponder()
 }
}
 
 3)
 extension ExchangeRateViewController: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         print(#function)
         return true
     }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
     }
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if string == "." && (textField.text?.contains(".") == true) {
             return false
         }
         return true
     }
 }


 */
