//
//  ViewController.swift
//  DelegateTableView
//
//  Created by dohien on 6/2/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

protocol MasterDelegate: class {
    func senData(data: String)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: MasterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        delegate?.senData(data: nameTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
}

