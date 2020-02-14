//
//  PopUpView.swift
//  Practise_Test
//
//  Created by apple on 29/01/20.
//  Copyright © 2020 com.lsservices.hellodoctors. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    
    func submitTapped(name:String, phone: String)
}

class PopUpView: UIView {

    var view:UIView!
    
    var delegate:PopUpDelegate!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp(){
        backgroundColor = .clear
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    func loadFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUpView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        self.delegate.submitTapped(name: nameTF.text!, phone: phoneTF.text!)
        self.removeFromSuperview()
    }
}
