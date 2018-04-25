//
//  ViewController.swift
//  challengeDojoAlertaTT
//
//  Created by Jackson Smith Moises Matias on 24/04/18.
//  Copyright © 2018 Jackson Smith Moises Matias. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    let locationManager = GeoLocation.locationManager
    let kPhaseTwoSegue = "phaseTwo"

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func tapSendButton(_ sender: Any) {
        if hasPermission() {
            performSegue(withIdentifier: kPhaseTwoSegue, sender: nil)
        } else {
            buildAlertPermissionError()
        }
    }
    
    fileprivate func hasPermission() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
    
    fileprivate func buildAlertPermissionError() {
        let alert = Alert(delegate: self).selectAlertErrors(alert: .firstRequestPermission)
        Alert(delegate: self).presenterAlert(alert: alert)
    }
    
}

extension MainViewController: CLLocationManagerDelegate {
    
    func setup() {
        locationManager.delegate = self
        
        // 🦕 Request Permision here
    }
    
}

