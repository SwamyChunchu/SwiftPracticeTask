//
//  GooglePathViewController.swift
//  SwamySwPractice
//
//  Created by amit on 3/3/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker
import GoogleMaps


class GooglePathViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate

{
    
    
    var mapView = GMSMapView()
    
    var latValue: Float = 0.0
    var longValue: Float = 0.0
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let locationManager = CLLocationManager()
        // For getting the user permission to use location service when the app is running
        //locationManager.requestWhenInUseAuthorization()
        // For getting the user permission to use location service always
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        locationManager.delegate=self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let lattitude  = locationManager.location?.coordinate.latitude
        let longitude  = locationManager.location?.coordinate.longitude
    
      
        
        
        print("Lattitude=\(lattitude)  Longitude=\(longitude)")

        
        let camera = GMSCameraPosition.camera(withLatitude: 30.7402543,
                                              longitude: 76.7738928,
                                              zoom: 8)
        
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.delegate = self
        mapView.mapType=kGMSTypeNormal
        mapView.settings.compassButton=true
        mapView.settings.myLocationButton=true
        mapView.isMyLocationEnabled=true
        mapView.setMinZoom(2, maxZoom: 15)
        mapView.animate(toBearing: 0)
        mapView.animate(toViewingAngle: 90)
        self.view = mapView
        
        

        let position = CLLocationCoordinate2D(latitude: 30.7402543, longitude: 76.7738928)
        let marker = GMSMarker(position: position)
        marker.title = "Sector 17, Chandigarh"
        marker.map = mapView
        
        
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        
        let polyline = GMSPolyline(path: path)
        polyline.map = mapView
        
        polyline.strokeColor = .black
        polyline.strokeWidth = 10.0
        polyline.geodesic = true
        let solidRed = GMSStrokeStyle.solidColor(.red)
        let redYellow =
            GMSStrokeStyle.gradient(from: .red, to: .yellow)
        polyline.spans = [GMSStyleSpan(style: solidRed),
                          GMSStyleSpan(style: solidRed),
                          GMSStyleSpan(style: redYellow)]
        
        polyline.spans = [GMSStyleSpan(style: solidRed, segments:2),
                          GMSStyleSpan(style: redYellow, segments:10)]
        
        
        let styles = [GMSStrokeStyle.solidColor(.white),
                      GMSStrokeStyle.solidColor(.black)]
        let lengths: [NSNumber] = [100, 5000]
        polyline.spans = GMSStyleSpans(polyline.path!, styles, lengths, kGMSLengthRhumb)
        
        
        let urlStr = "http://maps.googleapis.com/maps/api/directions/json?origin=\(lattitude),\(longitude)&destination=\(30.7402543),\(76.7738928)&sensor=true"
        
        print("You tapped at \(urlStr)")
        
       
        
    }
    
    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }
    
    
//
//    //MARK: API CALL
//    func GetRoughtofTwoLocation(){
//        let originString: String = "\(23.5800),\(72.5853)"
//        let destinationString: String = "\(24.5836),\(72.5853)"
//        let directionsAPI: String = "https://maps.googleapis.com/maps/api/directions/json?"
//        let directionsUrlString: String = "\(directionsAPI)&origin=\(originString)&destination=\(destinationString)&mode=driving"
//        
//        APICall().callApiUsingWithFixURLGET(directionsUrlString, withLoader: true) { (responceData) -> Void in
//            
//            let json = responceData as! NSDictionary
//            let routesArray: [AnyObject] = (json["routes"] as! [AnyObject])
//            var polyline: GMSPolyline? = nil
//            if routesArray.count > 0 {
//                let routeDict: [NSObject : AnyObject] = routesArray[0] as! [NSObject : AnyObject]
//                var routeOverviewPolyline: [NSObject : AnyObject] = (routeDict["overview_polyline"] as! [NSObject : AnyObject])
//                let points: String = (routeOverviewPolyline["points"] as! String)
//                let path: GMSPath = GMSPath(fromEncodedPath: points)!
//                polyline = GMSPolyline(path: path)
//                polyline!.strokeWidth = 2.0
//                polyline!.map = self.mapView
//            }
//            
//        }
//    }
//    
//    func APICall()
//    {
//        
//    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
 

}
