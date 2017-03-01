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

        
        self.array=["0","1","2","3","4","5","6","7","8","9","0","1","2","3","4","5","6","7","8","9","0","1","2","3","4","5","6","7","8","9"]

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        if UIScreen.main.bounds.width == 320 {
            layout.itemSize = CGSize(width: self.collectionViewSM.frame.size.width/4-4, height: 80)
        }
        if UIScreen.main.bounds.width == 414 {
            layout.itemSize = CGSize(width: self.collectionViewSM.frame.size.width/3-2, height: 100)
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
        
        
        
        
        
        return cell
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
