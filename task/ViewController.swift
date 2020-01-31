//
//  ViewController.swift
//  task
//
//  Created by Syed.Reshma Ruksana on 1/31/20.
//  Copyright © 2020 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    
    var namesArray = ["ALIA","DEEPIKA","PRIYANKA","ANUSHKA","ANANYA","TARA","JUHI","JHANVI","KUSHI"]

    @IBOutlet weak var tableview: UITableView!
    
    
    var selectedNames = [String]()
    
    var nonSelectedNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }

    
    @IBAction func refreshButton(_ sender: UIButton)
    {
             gettingNonSelectedNames()
             print(nonSelectedNames)
        print(nonSelectedNames.count)

                nonSelectedNames = nonSelectedNames.shuffled()
//            selectedNames.removeAll()
                namesArray = selectedNames + nonSelectedNames
        print(namesArray)
        print(namesArray.count)
        tableview.reloadData()
        
        
    }
    
    
    func gettingSelectedNames(select:String)
    {
        
        if(selectedNames.contains(select))
        {
            print("printing the selected items")
        }else{
            selectedNames.append(select)
        }
    }
    
   
    
    func  gettingNonSelectedNames()
    {
        nonSelectedNames.removeAll()
        
        for value in namesArray
        {
            if(selectedNames.contains(value))
            {
                print("printing non \(selectedNames)")
            }else{
                nonSelectedNames.append(value)
            }
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        gettingSelectedNames(select:namesArray[indexPath.row])
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return namesArray.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
          
       {
           var cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
           
           cell.textLabel?.text = namesArray[indexPath.row]
           
           return cell
          }
    
    
    
    
    
    
    
}

