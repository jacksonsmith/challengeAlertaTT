//
//  GeoLocation.swift
//  challengeDojoAlertaTT
//
//  Created by Jackson Smith Moises Matias on 24/04/18.
//  Copyright © 2018 Jackson Smith Moises Matias. All rights reserved.
//

import CoreLocation
import UIKit

class GeoLocation {
    
    static let locationManager = CLLocationManager()

    func setup() -> CLLocationManager {
        return GeoLocation.locationManager
    }
}

extension CLLocationCoordinate2D {
    func toString() -> String {
        return String(self.latitude) + " " + String(self.longitude)
    }
}
