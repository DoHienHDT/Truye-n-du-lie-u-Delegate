//
//  MasterViewController.swift
//  DelegateView
//
//  Created by dohien on 6/1/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit
class MasterViewController: UIViewController, Delegate {
    func sendData(data: String) {
        labeltextfield.text = data
    }
    var name: String?
    @IBOutlet weak var labeltextfield: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? DetailViewController
        viewController?.delegate = self
    }
}
