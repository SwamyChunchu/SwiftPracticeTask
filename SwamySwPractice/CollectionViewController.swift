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
    
    
    @IBOutlet weak var collectionViewSM: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.array=["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"]

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        if UIScreen.main.bounds.width == 320 {
            layout.itemSize = CGSize(width: self.view.frame.size.width/4+15, height: 150)
        }
        else if UIScreen.main.bounds.width == 375 {
            layout.itemSize = CGSize(width: self.view.frame.size.width/4+20, height: 150)
        }
       else if UIScreen.main.bounds.width == 414 {
            layout.itemSize = CGSize(width: self.view.frame.size.width/4+25, height: 150)
        }
        else{
            
            layout.itemSize = CGSize(width: self.collectionViewSM.frame.size.width/3-2, height: 150)
        }
        
       
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        self.collectionViewSM.collectionViewLayout = layout
        
    
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }

    
//    func collectionView(collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
////        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
////        let totalSpace = flowLayout.sectionInset.left
////            + flowLayout.sectionInset.right
////            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
////        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
//        return CGSize(width: UIScreen.main.bounds.width/3-4, height: 100)
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }


    
    
     func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        cell.label.text=array.object(at: indexPath.row) as? String
        
        
        return cell
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
