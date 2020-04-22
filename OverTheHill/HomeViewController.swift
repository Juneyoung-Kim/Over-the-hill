//
//  HomeViewController.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-02-23.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import RealmSwift


struct Facility {
    var name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}

class HomeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    let facilities = [Facility(name: "Amica Arbutus Manor", latitude: 49.247583, longitude: -123.155612),
                      Facility(name: "Amica Somerset House", latitude: 48.412557, longitude:-123.376142),
                      Facility(name: "Augustine House", latitude: 49.073316, longitude: -123.077039),
                      Facility(name: "Casa Loma Seniors Village", latitude: 49.702792, longitude: -124.992393)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getting facilities on the map
        checkLocationServices()
        fetchFacilitiesOnMap(facilities)
        
        //getting the current location
           locationManager.requestAlwaysAuthorization()
             locationManager.requestWhenInUseAuthorization()
             if CLLocationManager.locationServicesEnabled() {
                 locationManager.delegate = self
                 locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                 locationManager.startUpdatingLocation()
             }
         }

         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
             guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
             print("locations = \(locValue.latitude) \(locValue.longitude)")
         }
    
    
    // setting facilities
        
    func checkLocationServices() {
          if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
          } else {
            // Show alert letting the user know they have to turn this on.
          }
        }
    
        
    func checkLocationAuthorization() {
            switch CLLocationManager.authorizationStatus() {
                
            case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            case .denied: // Show alert telling users how to turn on permissions
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                mapView.showsUserLocation = true
            case .restricted: // Show an alert letting them know what’s up
                break
            case .authorizedAlways:
                break
        }
}

func fetchFacilitiesOnMap(_ facilities: [Facility]) {
   for facility in facilities {
     let annotations = MKPointAnnotation()
     annotations.title = facility.name
     annotations.coordinate = CLLocationCoordinate2D(latitude: facility.latitude, longitude: facility.longitude)
     mapView.addAnnotation(annotations)
   }
 }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.barTintColor =  #colorLiteral(red: 0.788, green: 0.531, blue: 0.388, alpha: 1.0)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    @IBAction func ResidentialCareButton() {
//
//    }
//
//    @IBAction func AssistantLivingButton() {
//    }
//
}
