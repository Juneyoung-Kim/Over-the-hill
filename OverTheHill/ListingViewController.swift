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

    @IBOutlet weak var listingName: UILabel!
    @IBOutlet weak var typeOfFacility: UILabel!
    
    @IBOutlet weak var listingDescription: UITextView!
    @IBOutlet weak var listingInfo: UITextView!
    
    @IBOutlet weak var listingMap: MKMapView!
   
    
    var currentListing: Homes?
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

        listingName.text = currentListing?.BUSINESS_NAME 
        typeOfFacility.text = currentListing?.TYPE
        
        listingInfo.text = currentListing?.description ?? "No description found"
        
       }

  
}
