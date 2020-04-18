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

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var listingMap: MKMapView!
    var currentListing: Homes?
    
    @IBOutlet weak var booking: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           textView.text = currentListing?.description ?? "No description found"
       }

  
}
