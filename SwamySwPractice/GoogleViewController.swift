//
//  GoogleViewController.swift
//  SwamySwPractice
//
//  Created by amit on 3/2/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker

class GoogleViewController: UIViewController,CLLocationManagerDelegate
{
    
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    var placesClient: GMSPlacesClient!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addsLabel: UILabel!
    
    @IBOutlet weak var imgVW: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationManager = CLLocationManager()
        // For getting the user permission to use location service when the app is running
        //locationManager.requestWhenInUseAuthorization()
        // For getting the user permission to use location service always
        locationManager.requestAlwaysAuthorization()


          placesClient = GMSPlacesClient.shared()
        
        
        
        
        
        
       
    }

    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        
        
    
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: { (place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            guard let place = place else {
                print("No place selected")
                return
            }
            
            print("Place name \(place.name)")
            print("Place address \(place.formattedAddress)")
            print("Place attributions \(place.attributions)")
        })
        
        
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                for likelihood in placeLikelihoodList.likelihoods {
                    let place = likelihood.place
                    
                //    print("Current Place name \(place.name)")
                    
                    
                  //  print("Current Place name \(place.name) at likelihood \(likelihood.likelihood)")
                  //  print("Current Place address \(place.formattedAddress)")
                   // print("Current Place attributions \(place.attributions)")
                 //   print("Current PlaceID \(place.placeID)")
                    
                    
                }
            }
        })

        
        
//        let userAddedPlace = GMSUserAddedPlace()
//        userAddedPlace.name = "Swamy Sam!"
//        userAddedPlace.address = "Iikyal, Luxettipet, Mancherial, 504214"
//        userAddedPlace.coordinate = CLLocationCoordinate2DMake(-33.8669710, 151.1958750)
//        userAddedPlace.phoneNumber = "9573019769"
//        userAddedPlace.website = "http://www.swamy433.wapgem.com"
//        userAddedPlace.types = ["School"]
//        placesClient.add(userAddedPlace, callback: { (place, error) -> Void in
//            if let error = error {
//                print("Add Place error: \(error.localizedDescription)")
//                return
//            }
//            
//            if let place = place {
//                print("Added place with placeID \(place.placeID)")
//                print("Added Place name \(place.name)")
//                print("Added Place address \(place.formattedAddress)")
//            }
//        })
        
        
        
        // A hotel in Saigon with an attribution.
        let placeID = "ChIJB31orz1IzTsR4eyp948CZJ4"
        
        placesClient.lookUpPlaceID(placeID, callback: { (place, error) -> Void in
            if let error = error {
                print("lookup place id query error: \(error.localizedDescription)")
                return
            }
            
            guard let place = place else {
                print("No place details for \(placeID)")
                return
            }
            
            print("Place name \(place.name)")
            print("Place address \(place.formattedAddress)")
            print("Place placeID \(place.placeID)")
            print("Place attributions \(place.attributions)")
        })
    
        
        
        
     self.loadFirstPhotoForPlace(placeID: "ChIJB31orz1IzTsR4eyp948CZJ4" )
}
    
    
    func loadFirstPhotoForPlace(placeID: String) {
        GMSPlacesClient.shared().lookUpPhotos(forPlaceID: placeID) { (photos, error) -> Void in
            if let error = error {
                // TODO: handle the error.
                print("Error: \(error.localizedDescription)")
            } else {
                if let firstPhoto = photos?.results.first {
                    self.loadImageForMetadata(photoMetadata: firstPhoto)
                }
            }
        }
    }
    
    func loadImageForMetadata(photoMetadata: GMSPlacePhotoMetadata) {
        GMSPlacesClient.shared().loadPlacePhoto(photoMetadata, callback: {
            (photo, error) -> Void in
            if let error = error {
                // TODO: handle the error.
                print("Error: \(error.localizedDescription)")
            } else {
                self.imgVW.image = photo;
                self.addsLabel.attributedText = photoMetadata.attributions;
            }
        })
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
