//
//  ViewController.swift
//  Practise_Test
//
//  Created by apple on 29/01/20.
//  Copyright © 2020 com.lsservices.hellodoctors. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PopUpDelegate {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    var showPopupView:PopUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let path = Bundle.main.path(forResource: "state-city", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
//            print(json)
            guard let states_citiesArray = json as? [String: [String]] else { return}
            let stateArray = states_citiesArray.keys.sorted()
            print(stateArray)
            
            
//            var cityArray = states_citiesArray["Haryana"]
//            print("Haryana", cityArray)
            
            for state in stateArray {
                guard let cityArray = states_citiesArray[state] else { return }
                print(cityArray)
                print(state)
            }
            
        }catch{
            print(error)
        }
    }
    
    func submitTapped(name: String, phone: String) {
        nameLbl.text = name
        phoneLbl.text = phone
    }
    
    
    @IBAction func clickOnTapped(_ sender: Any) {
        
        self.showPopupView = PopUpView(frame: CGRect(x: 20, y: 300, width: 375, height: 300))
        showPopupView.delegate = self
        self.view.addSubview(self.showPopupView)
    }
    
}

