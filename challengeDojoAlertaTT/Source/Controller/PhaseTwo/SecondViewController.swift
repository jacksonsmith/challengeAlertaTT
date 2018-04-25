//
//  SecondViewController.swift
//  challengeDojoAlertaTT
//
//  Created by Jackson Smith Moises Matias on 24/04/18.
//  Copyright © 2018 Jackson Smith Moises Matias. All rights reserved.
//

import UIKit
import CoreLocation

enum RioDeJaneiroLocation: Double {
    case longitude
    case latitude
    
    func value() -> Double {
        switch self {
        case .longitude:
            return -43.209586899999998
        case .latitude:
            return -22.903539299999998
        }
    }
    
}

class SecondViewController: UIViewController {
    
    let locationManager = GeoLocation.locationManager
    let phaseThreeSegue = "phaseThree"
    
    var location: CLLocation? = nil
    
    override func viewDidLoad() {
        setup()
    }
    
    @IBAction func tapSendButton(_ sender: Any) {
        if hasLocationRioDeJaneiro() {
            performSegue(withIdentifier: phaseThreeSegue, sender: nil)
        } else {
            buildNotRioDeJaneiroLocationAlertError()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == phaseThreeSegue {
            setPhaseThreeValue(thirdVC: segue.destination)
        }
    }
    
    fileprivate func hasLocationRioDeJaneiro() -> Bool {
        return location?.coordinate.longitude == RioDeJaneiroLocation.longitude.value()
            && location?.coordinate.latitude == RioDeJaneiroLocation.latitude.value()
    }
    
    fileprivate func buildNotRioDeJaneiroLocationAlertError() {
        let alert = Alert(delegate: self).selectAlertErrors(alert: .secondNotRioDeJaneiroLocation)
        Alert(delegate: self).presenterAlert(alert: alert)
    }
    
    fileprivate func setPhaseThreeValue(thirdVC: UIViewController) {
        let thirdViewController = thirdVC as? ThirdViewController
        thirdViewController?.firstLocation = location
        
        if let location = location {
            thirdViewController?.firstLocationText = location.coordinate.toString()
        }
    }
    
}

extension SecondViewController : CLLocationManagerDelegate {
    
    func setup() {
        locationManager.delegate = self
        
        // 🦖 Start job to get locations
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
    
}
