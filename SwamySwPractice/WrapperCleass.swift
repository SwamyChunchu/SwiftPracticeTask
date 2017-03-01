//
//  WrapperCleass.swift
//  SwamySwPractice
//
//  Created by amit on 2/17/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit
import Alamofire

class WrapperCleass: NSObject {

    
    class func alert(_ title : String, message : String, view:UIViewController)
    {
        let alert = UIAlertController(title:title, message:  message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        view.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    class func requestGETURL(_ strURL: String, params : [String : AnyObject]?, success:@escaping (NSDictionary) -> Void, failure:@escaping (NSError) -> Void) {
        let urlwithPercentEscapes = strURL.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)
        Alamofire.request(urlwithPercentEscapes!, method: .get, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if response.result.isSuccess {
                    let resJson = response.result.value as! NSDictionary
                    success(resJson)
                }
                if response.result.isFailure {
                    let error : NSError = response.result.error! as NSError
                    failure(error)
                }
        }
    }
    
    
    
    class func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, success:@escaping (NSDictionary) -> Void, failure:@escaping (NSError) -> Void){
        
        let urlwithPercentEscapes = strURL.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)
        Alamofire.request(urlwithPercentEscapes!, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if response.result.isSuccess {
                    let resJson = response.result.value as! NSDictionary
                    success(resJson)
                }
                if response.result.isFailure {
                    let error : NSError = response.result.error! as NSError
                    failure(error)
                }
        }
    }
    
    
    class func requestPUTURL(_ strURL : String, params : [String : AnyObject]?, success:@escaping (NSDictionary) -> Void, failure:@escaping (NSError) -> Void){
        let urlwithPercentEscapes = strURL.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)
        Alamofire.request(urlwithPercentEscapes!, method: .put, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if response.result.isSuccess {
                    let resJson = response.result.value as! NSDictionary
                    success(resJson)
                }
                if response.result.isFailure {
                    let error : NSError = response.result.error! as NSError
                    failure(error)
                }
        }
    }
    class func requestPostWithMultiFormData(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (NSDictionary) -> Void, failure:@escaping (NSError) -> Void){
        
        Alamofire.upload(multipartFormData:{ multipartFormData in
        }, to: strURL, encodingCompletion: {result in
            
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON
                    {
                        response in
                        //                        print(response.request )  // original URL request
                        //                        print(response.response) // URL response
                        //                        print(response.data)     // server data
                        print(response.result)   // result of response serialization
                        
                        if let JSON = response.result.value
                        {
                            print("JSON: \(JSON)")
                        }
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
        
    }

    
    
}






extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
    
}

@IBDesignable extension UIView {
    
    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */
    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
     * [0,1] range will give undefined results. Animatable. */
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    /* The shadow offset. Defaults to (0, -3). Animatable. */
    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
}


