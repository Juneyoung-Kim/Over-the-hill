//
//  ListingViewController.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-02-24.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import UIKit
import MapKit

class ListingViewController: UIViewController {

    @IBOutlet weak var listingImg: UIImageView!
    
    @IBOutlet weak var listingName: UILabel!
    @IBOutlet weak var typeOfHome: UILabel!
    
    @IBOutlet weak var listingInfo: UITextView!
   
    @IBOutlet weak var listingMap: MKMapView!
    
    @IBOutlet weak var booktour: UIButton!
    
    var currentListing: Homes?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

        typeOfHome.text = currentListing?.TYPE
        
        listingInfo.text = currentListing?.description ?? "No description found"
       }  
}
