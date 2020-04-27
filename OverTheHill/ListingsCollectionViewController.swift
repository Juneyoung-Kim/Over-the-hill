//
//  ListingsCollectionViewController.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-02-24.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "cell"

struct ListingInfo {
    var name: String
    var description: String
}


class ListingsCollectionViewController: UICollectionViewController {

    var listings: Results<Homes>?
    var currentIndex = 0
    var images:[UIImage?] =
        [ UIImage(named: "img/1.jpg"),
          UIImage(named: "img/2.jpg"),
          UIImage(named: "img/3.jpg"),
          UIImage(named: "img/4.jpeg"),
          UIImage(named: "img/5.jpg"),
          UIImage(named: "img/6.jpg"),
          UIImage(named: "img/7.png"),
          UIImage(named: "img/8.jpeg"),
          UIImage(named: "img/9.jpeg"),
          UIImage(named: "img/10.jpeg"),
          UIImage(named: "img/11.jpg"),
          UIImage(named: "img/12.jpg"),
          UIImage(named: "img/13.jpg"),
          UIImage(named: "img/14.jpeg"),
          UIImage(named: "img/15.jpeg"),
          UIImage(named: "img/16.jpg"),
          UIImage(named: "img/17.jpg"),
          UIImage(named: "img/18.jpg"),
          UIImage(named: "img/19.jpg"),
          UIImage(named: "img/20.jpg")]
    
    var randomPrice = ["$3,200","$4,550","$3,450","$2,570","$2,200","$3,400","$2,300","$3,100","$2,500","$2,100","$3,220","$3,150","$2,400","$4,300","$2,700","$2,990","$3,210","$4,100","$2,300","$4,000"]
    var currencyFormatter = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = Realm.Configuration(
                          // Get the URL to the bundled file
                          fileURL: Bundle.main.url(forResource: "Homes", withExtension: "realm"),
                          // Open the file in read-only mode as application bundles are not writeable
                          readOnly: true)
               
                      // Open the Realm with the configuration
                      let realm = try! Realm(configuration: config)
               
                      // Read some data from the bundled Realm
                      let results = realm.objects(Homes.self)
        listings = results
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ListingViewController {
            vc.currentListing = listings?[currentIndex]
               }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(20, listings?.count ?? 1)
       }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        if let customCell = cell as? ListingsCollectionViewCell {
            
            customCell.listingImg.image = images[indexPath.row]
            
            customCell.listingName.text = "\(String(describing: listings![indexPath.row].BUSINESS_NAME))"
            
            customCell.price.text = "\(String(randomPrice[indexPath.row]))"
            
            customCell.typeOfFacility.text = "\(String(describing: listings![indexPath.row].TYPE))"
            
            customCell.availability.text = "\(String(describing: listings![indexPath.row].SENIOR_PUBLIC_UNITS))"
            
            customCell.location.text = "\(String(describing: listings![indexPath.row].POSTAL_CODE))"
            
            return customCell
        }
        return cell
    }
  

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        print("\(indexPath)")
        performSegue(withIdentifier: "showDetail", sender: self)
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
   
}



