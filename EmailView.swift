//
//  EmailView.swift
//  ContainerViewSample
//
//  Created by Santhosh K on 05/07/22.
//

import UIKit

class EmailView: UIView {

    static func loadXib() -> EmailView {
        return UINib(nibName: "EmailView", bundle: .main).instantiate(withOwner: self, options: nil).first as! EmailView
    }
    
  
}
