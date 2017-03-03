//
//  TabelViewController.swift
//  SwamySwPractice
//
//  Created by amit on 2/20/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit

class TabelViewController: UIViewController,UITableViewDataSource,UITableViewDelegate


{
    
    var array = NSArray()
    var myStringValue:String?
    var cell: TableViewCell!
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.myTableView.delegate=self
        self.myTableView.dataSource=self
        
        
        array=["0","1","2","3","4","5","6","7","8","9"]
        
        // Do any additional setup after loading the view.
    }

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        
        let identifier = "TableViewCell"
        
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableViewCell
        
        
        if cell == nil
        {
            tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableViewCell
        }
        
        tableView.separatorStyle = .none
        tableView.separatorColor = UIColor.clear
        
        if indexPath.row==0
        {
            
           // myStringValue = UserDefaults.standard.value(forKey: "strSave") as! String?
            cell.backgroundColor = UIColor.green
            cell.label.text=myStringValue
        
        }else{
            
        cell.label.text=array.object(at: indexPath.row) as?String
            
        }
        
//        let intu = indexPath.row
//        
//        if  intu % 2 == 0 {
//            print("int value \(intu)")
//            cell.backgroundColor = UIColor.lightGray
//        }
//        else
//        {
//            cell.backgroundColor = UIColor.white
//            print("int value \(intu)")
//        }
        
        cell.backgroundColor = getRandomColor()
        
        
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        cell.selectedBackgroundView = selectedView
        
       // cell!.contentView.backgroundColor = .white
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if indexPath.row==indexPath.row {
             //cell!.contentView.backgroundColor = .white
        }
        let myVC = storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController
        
        //  self.present(myVC!, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(myVC!, animated: true)

        print("row selected \(indexPath.row)" )
    }
    
    
    
    
    
    
    
    
    
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
