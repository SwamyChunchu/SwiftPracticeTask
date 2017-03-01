//
//  ViewController.swift
//  SwamySwPractice
//
//  Created by amit on 2/17/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBOutlet weak var passWordTF: UITextField!
    
    
    @IBOutlet weak var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
    }

    @IBAction func goButtonAction(_ sender: Any) {
        
        
        if nameTF.text?.characters.count == 0
        
        {
           WrapperCleass.alert("Swift Test", message: "Please Enter name", view: self)
            
        }
        else if  passWordTF.text?.characters.count == 0
        {
            WrapperCleass.alert("Swift Test", message: "Please Enter pessword", view: self)

        }
        else{
            
            let myVC = storyboard?.instantiateViewController(withIdentifier: "MyViewController") as? MyViewController
            
        //  self.present(myVC!, animated: true, completion: nil)
            
            self.navigationController?.pushViewController(myVC!, animated: true)
        }
        
        
        
        
      
        
        
        
//         let strURL = String (format:"http://bluedint.co.in/api/index.php/12345/deal_all/")
//        
//        
              let dict = ["city": "","category": "","member": "1","page": "1",]
//        
//        //city=%@&category=%@&member=%@&page=%@","","","1","1"
//        
//        WrapperCleass.requestPOSTURL(strURL, params:dict as [String : AnyObject]?, success: { (jsonDic) in
//            
//             let dic:NSDictionary = jsonDic as NSDictionary
//            
//            print(dic)
//            
//            
//        })
//            
//            
//        { (error) in
//            
//            print(error.localizedDescription)
//            
//        }

//        Alamofire.request("http://bluedint.co.in/api/index.php/12345/deal_all/", method: .post, parameters: dict, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            
//            switch(response.result) {
//            case .success(_):
//                if response.result.value != nil{
//                    
//                    print(response)
//                }
//                break
//                
//            case .failure(_):
//                
//                print(response.result.error)
//                
//                break
//                
//            }
//        }
        
        
//               var request = URLRequest(url: URL(string: "http://bluedint.co.in/api/index.php/12345/deal_all/")!)
//        request.httpMethod = "POST"
//        let postString = "city=&category=&member=1&page=1"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//            
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//            
//            let responseString = String(data: data, encoding: .utf8)
//            
//            
//            //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
//            
//            
//            print("responseString = \(json)")
//        }
//        task.resume()
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters = ["city": "", "category": "","member": "1","page": "1"] as Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "http://bluedint.co.in/api/index.php/12345/deal_all/")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    
    
        
    }
    

    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

