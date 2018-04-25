//
//  FourthViewController.swift
//  challengeDojoAlertaTT
//
//  Created by Jackson Smith Moises Matias on 25/04/18.
//  Copyright © 2018 Jackson Smith Moises Matias. All rights reserved.
//

import UIKit
import SwiftGifOrigin


class FourthViewController : UIViewController {
    
    override func viewDidLoad() {
        let fourthView = view as? FourthView
        fourthView?.cristianoGif.image = UIImage.gif(name: "cristiano")
        fourthView?.michaelGif.image = UIImage.gif(name: "michael")
    }
    
}
