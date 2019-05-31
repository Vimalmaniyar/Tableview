//
//  ViewController.swift
//  new
//
//  Created by Sandip on 5/28/19.
//  Copyright © 2019 ShayonaPayal. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   // var list = ["one","two","three","four"]
  var list:[Int:String] = [1:"One",2:"Two", 3:"Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(tap))
        self.navigationItem.leftBarButtonItem = addButton
        for i in 0...30
        {
            let a=String(i)
            list.updateValue(a, forKey: i)
            //list.append(i:a)
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showAlertWithTextField(controller: UIViewController) {
        let alertController = UIAlertController(title: "Add new tag", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                self.list.updateValue(text, forKey:35)
          //      self.list.append(text)
                self.tableView.reloadData()
                
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Tag"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        controller.present(alertController, animated: true, completion: nil)
    }
  
    @objc func tap()
    {
        self.showAlertWithTextField(controller: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
       let cell:UITableViewCell=UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier:"cell")
       cell.textLabel?.text = list[indexPath.row]
        
        return cell
        }
  //*/  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     /*   if editingStyle == .delete {
           list.remove(at: <#T##Dictionary<Int, String>.Index#>)
            //self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }*/
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
         
            cell.accessoryType = .checkmark
            
        }
    }
}


