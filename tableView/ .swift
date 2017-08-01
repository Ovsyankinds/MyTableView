//
//  ViewController.swift
//  tableView
//
//  Created by Ovsyankinds on 20/07/2017.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let arr = ["aaa", "bbb", "ccc"]
    var selectName: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = self.arr[indexPath.row]
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let a: SecondViewController = segue.destination as! SecondViewController
        
        if(segue.identifier == "tableView"){
            a.labelSecondVC = "Take \(self.selectName!)"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectName = self.arr[indexPath.row]
        self.performSegue(withIdentifier: "tableView", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

