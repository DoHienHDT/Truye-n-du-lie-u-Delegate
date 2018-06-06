//
//  ViewController.swift
//  DelegateView
//
//  Created by dohien on 6/1/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit
protocol Delegate{
    func sendData(data: String)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    var delegate : Delegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnSend(_ sender: UIButton) {
        if delegate != nil {
            if nameTextfield.text != nil {
                let text = nameTextfield.text
                delegate?.sendData(data: text!)
                // dis quay lai
                dismiss(animated: true, completion: nil)
            }
        }
    }
    

}

