//
//  DisplayNameView.swift
//  ContainerViewSample
//
//  Created by Santhosh K on 05/07/22.
//

import UIKit


enum GuessBrandViewAction {
    case timeOver(String)
    case gameOver([String:Any])
}


class DisplayNameView: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    
    var handle:((String)->Void)?
    
    static func loadXib() -> DisplayNameView {
        return UINib(nibName: "DisplayNameView", bundle: .main).instantiate(withOwner: self, options: nil).first as! DisplayNameView
    }
    
    
    
    
    func changeName(_ name:String ) {
        self.nameLbl.text = name
        emailTF.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handle!(textField.text ?? "")
    }
}
