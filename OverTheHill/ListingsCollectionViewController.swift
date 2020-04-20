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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            let itemsPerRow: CGFloat = 1
            let padding: CGFloat = 5
            let totalPadding = padding * (itemsPerRow - 1)
            let individualPadding = totalPadding / itemsPerRow
            let width = collectionView.frame.width / itemsPerRow - individualPadding
            let height = width
            layout.itemSize = CGSize(width: width, height: height)
            layout.minimumInteritemSpacing = padding
            layout.minimumLineSpacing = padding
        }
        
        
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
        
//
//        listings.append(ListingInfo(name: "\(results[0].BUSINESS_NAME)", description: "Description about Listing 1"))
//        listings.append(ListingInfo(name: "\(results[1].BUSINESS_PHONE)", description: "Description about Listing 2"))
//        listings.append(ListingInfo(name: "\(results[2].CITY)", description: "Description about Listing 3"))
//        listings.append(ListingInfo(name: "\(results[3].POSTAL_CODE)", description: "Description about Listing 4"))
        
        
        
        
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
        return listings?.count ?? 1
       }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        if let customCell = cell as? ListingsCollectionViewCell {
            customCell.listingName.text = "\(String(describing: listings?[indexPath.row].BUSINESS_NAME))"
            
            customCell.typeOfFacility.text = "\(String(describing: listings?[indexPath.row].TYPE))"
            
            customCell.availability.text = "\(String(describing: listings?[indexPath.row].SENIOR_PUBLIC_UNITS))"
            
            customCell.location.text = "\(String(describing: listings?[indexPath.row].POSTAL_CODE))"
            
         
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

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
   

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
