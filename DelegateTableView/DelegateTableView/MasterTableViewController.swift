//
//  MasterTableViewController.swift
//  DelegateTableView
//
//  Created by dohien on 6/2/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController, MasterDelegate {
    
    var number = Array(1...5)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var FootetView: UIView!
    @IBOutlet var Nodata: UIView!
    var hasNoData : Bool = false{
        didSet{
            hasNoData ? (tableView.tableFooterView = Nodata) : (tableView.tableFooterView = FootetView)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hasNoData = number.count == 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return number.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text  = String(number[indexPath.row])
        return cell
    }
    
    func senData(data: String) {
        let num = Int(data) ?? 0
        if let indexPath = tableView.indexPathForSelectedRow{
        number[indexPath.row] = num
        tableView.reloadRows(at: [indexPath], with: .automatic)
        }else {
            number.append(num)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            hasNoData = number.count == 0
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as? DetailViewController
        vc?.delegate = self
    }
    

}
