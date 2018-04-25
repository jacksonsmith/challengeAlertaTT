//
//  ThirdViewController.swift
//  challengeDojoAlertaTT
//
//  Created by Jackson Smith Moises Matias on 24/04/18.
//  Copyright © 2018 Jackson Smith Moises Matias. All rights reserved.
//

import UIKit
import CoreLocation

class ThirdViewController: UIViewController {
    
    // MARK: - Properties
    
    let locationManager = GeoLocation.locationManager
    
    var mainView: ThreeView? = nil
    
    var firstLocationText: String = ""
    var firstLocation: CLLocation? = nil
    var secondLocation: CLLocation? = nil
    
    var totalDistance: CLLocationDistance? = nil
    
    // MARK: - Overrride

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = view as? ThreeView
        setup()
    }

    // MARK: - Action

    @IBAction func tapSendButton(_ sender: Any) {
        setSecondLocationWhetherHasLocation()
        
        if let first = firstLocation, let second = secondLocation {
            calculateAndSetDistance(first: first, second: second)
            
            hasDistanceAndSegueForFinalScreen()
        }
    }
    
    // MARK: - Functions

    // 🐙 complete a função, calcule a distância entre a localização utilizando as duas variáveis
    fileprivate func calculateAndSetDistance(first: CLLocation, second: CLLocation) {
        totalDistance = nil
    }
    
    // MARK: - Support Functions

    fileprivate func hasDistanceAndSegueForFinalScreen() {
        if let distance = totalDistance {
            mainView?.distanceLocationLabel.text = String(distance)
            buildFinalTaskCompletedAlert()
        } else {
            buildNotAddedLocationAlertError()
        }
    }
    
    fileprivate func setSecondLocationWhetherHasLocation() {
        if let location = secondLocation {
            mainView?.secondLocationLabel.text = "Segunda Localização : " + location.coordinate.toString()
        } else {
            buildNotAddedLocationAlertError()
        }
    }
    
    // MARK: - Alert Methods
    
    fileprivate func buildNotAddedLocationAlertError() {
        let alert = Alert(delegate: self).selectAlertErrors(alert: .thirdLocationNotAdded)
        Alert(delegate: self).presenterAlert(alert: alert)
    }
    
    fileprivate func buildCalculateDistanceAlertError() {
        let alert = Alert(delegate: self).selectAlertErrors(alert: .thirdNeedDistanceBetweenLocation)
        Alert(delegate: self).presenterAlert(alert: alert)
    }
    
    fileprivate func buildFinalTaskCompletedAlert() {
        let alert = Alert(delegate: self).selectAlertErrors(alert: .thidCompleteFinalTask)
        Alert(delegate: self).presenterAlert(alert: alert)
    }
}

// MARK: - Extensions

extension ThirdViewController: CLLocationManagerDelegate {
    
    func setup() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mainView?.firstLocationLabel.text = "Primeira Localização : " + firstLocationText
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        secondLocation = locations.first
    }
    
}

