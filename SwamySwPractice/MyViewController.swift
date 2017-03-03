//
//  MyViewController.swift
//  SwamySwPractice
//
//  Created by amit on 2/17/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    static let myName = "SwamySam"
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let child = UIView(frame: CGRect(x: self.view.frame.size.width/2-50, y: 100,width:100, height: 100))
        child.backgroundColor = UIColor.red
        self.view.addSubview(child)
        
        let slider = UISlider (frame: CGRect(x: self.view.frame.size.width/2-150, y: 180,width:300, height: 100))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = UIColor.red
        slider.isContinuous = true
        slider.value = 30
        slider.addTarget(self, action:#selector(sliderValueDidChange), for: .valueChanged)
        self.view.addSubview(slider)
        
        let button  = UIButton (frame : CGRect (x:self.view.frame.size.width/2-50, y:300 ,width:100 , height:40))
        button.backgroundColor = UIColor.red
        button.setTitle("Go here", for:.normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        let switchDemo = UISwitch(frame: CGRect(x:self.view.frame.size.width/2-20, y:420 ,width:40, height:40))
        switchDemo.isOn  = true
        switchDemo.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        self.view.addSubview(switchDemo)
        
        let segmentedControl = UISegmentedControl(frame: CGRect(x:self.view.frame.size.width/2-130, y:260 ,width:260, height:30))
        segmentedControl.insertSegment(withTitle:"index 0", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle:"index 1", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle:"index 2", at: 2, animated: false)
        segmentedControl.addTarget(self, action: #selector(getSegmentedControlValue), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        self.view.addSubview(segmentedControl)


    }

    
    
    func sliderValueDidChange(sender:UISlider!)
    {
        print("value : \(sender.value)")
    }
    
    
    
    func buttonClicked(sender:UIButton!)
    {
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "TabelViewController") as? TabelViewController
        
        //  self.present(myVC!, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(myVC!, animated: true)
        
       //        myVC?.myStringValue="Nuvvu Nenu"
       //        UserDefaults.standard.set("HelloWorld", forKey: "strSave")
       //        UserDefaults.standard.synchronize()
        
                myVC?.myStringValue="TableViewController"
        
        

         print("Button Clicked")
    }
    
    
    func switchChanged(sender: UISwitch!){
        
        print("value: \(sender.isOn)")
    }
    
    
    
    func getSegmentedControlValue(sender:UISegmentedControl!) {
        if  sender.selectedSegmentIndex == 0 {
            print("index 0")
            
        }
        else if sender.selectedSegmentIndex == 1 {
            
            print("index 1")
            
        }
        else {
            print("index 2")
            
         
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
