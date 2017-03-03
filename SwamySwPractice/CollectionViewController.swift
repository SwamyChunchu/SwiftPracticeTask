//
//  CollectionViewController.swift
//  SwamySwPractice
//
//  Created by amit on 2/23/17.
//  Copyright © 2017 Think360Solutions. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource

{

    var array = NSArray()
    
    var cell = CollectionViewCell()
   
    
    
    
    @IBOutlet weak var collectionViewSM: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.array=["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"]

       let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let width = UIScreen.main.bounds.size.width
         layout.itemSize = CGSize(width: (width/3)-15, height: 100)
        
        
//        if UIScreen.main.bounds.width == 320 {
//            layout.itemSize = CGSize(width: self.view.frame.size.width/4+15, height: 150)
//        }
//        else if UIScreen.main.bounds.width == 375 {
//            layout.itemSize = CGSize(width: self.view.frame.size.width/4+20, height: 150)
//        }
//       else if UIScreen.main.bounds.width == 414 {
//            layout.itemSize = CGSize(width: self.view.frame.size.width/4+25, height: 150)
//        }
//        else{
//            
//            layout.itemSize = CGSize(width: self.collectionViewSM.frame.size.width/3-2, height: 150)
//        }
//        
       
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        self.collectionViewSM.collectionViewLayout = layout
        
        
    
    }

    
//    func collectionView(_ collectionView: UICollectionView,
//                        willDisplay cell: UICollectionViewCell,
//                        forItemAt indexPath: IndexPath)
//    {
//        if array.count%2 == 0 {
//            cell.backgroundColor=UIColor.red
//        }else{
//            cell.backgroundColor=UIColor.brown
//        }
//        
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }


    
//    func collectionView(collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        //device screen size
//        let width = UIScreen.main.bounds.size.width
//        //calculation of cell size
//        return CGSize(width: ((width / 2-5))   , height: 155)
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }


    
    
     func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        cell.label.text=array.object(at: indexPath.row) as? String
        
        // iam changed name label in collection view cell, and changed design.
        
        
     
        
        // dequeue cell
        let intu = indexPath.row
        
        if  intu % 2 == 0 {
            
            print("int value \(intu)")
            cell.backgroundColor = getRandomColor()
        }
        else
        {
            cell.backgroundColor = getRandomColor()
            print("int value \(intu)")
        }

       

        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Message", message: "Selected Item \(indexPath.row)", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
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
