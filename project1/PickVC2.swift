//
//  PickVC2.swift
//  project1
//
//  Created by Rosalie Ma on 4/12/19.
//  Copyright © 2019 Rosalie Ma. All rights reserved.
//

import Foundation

import UIKit
import CoreLocation


class PickVC2: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var PickPic: UIImageView!
    let locationManager = CLLocationManager()
    var locValue:CLLocationCoordinate2D
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.locValue.latitude = Double("")!
        self.locValue.longitude = Double("")!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.PickPic.image = #imageLiteral(resourceName: "loading")
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        //set picked image
        let pick_image:UIImage = load_img(position: locValue)
        self.PickPic.image = pick_image
        
    }
    
    func load_img(position: CLLocationCoordinate2D) -> UIImage {
        //TODO: query server using location and decode the image
        //self.locValue.latitude, self.locValue.longitude
        return 
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locValue = manager.location!.coordinate
        
        manager.stopUpdatingLocation()
    }
    
    
    // Actions
    @IBAction func Confirm(_ sender: UIButton) {
        
        
    }
    
}

