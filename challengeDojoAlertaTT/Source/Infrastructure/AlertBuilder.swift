//
//  AlertBuilder.swift
//  challengeDojoAlertaTT
//
//  Created by Jackson Smith Moises Matias on 25/04/18.
//  Copyright © 2018 Jackson Smith Moises Matias. All rights reserved.
//

import UIKit

enum AlertErrors {
    case firstRequestPermission
    case secondNotRioDeJaneiroLocation
    case thirdLocationNotAdded
    case thirdNeedDistanceBetweenLocation
    case thidCompleteFinalTask
}

class Alert {
    
    typealias completion = ((UIAlertAction) -> Void)
    
    weak var delegate: UIViewController?
    
    init(delegate: UIViewController) {
        self.delegate = delegate
    }
    
    func builder(title: String, message: String, style: UIAlertControllerStyle, handler: completion? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive , handler: handler))
        delegate?.present(alert, animated: true, completion: nil)
    }
    
    func getAlert(title: String, message: String, style: UIAlertControllerStyle, handler: completion? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive , handler: handler))
        return alert
    }
    
    func selectAlertErrors(alert: AlertErrors) -> UIAlertController {
        
        guard let vc = delegate else {return UIAlertController()}
        
        switch alert {
        case .firstRequestPermission:
            return Alert(delegate: vc).getAlert(title: "Request Permission to advance",
                                          message: "Pra avançar peça permissão de localização para o usuário",
                                          style: .alert)
        case .secondNotRioDeJaneiroLocation:
            return Alert(delegate: vc).getAlert(title: "Envia a localização Certa",
                                          message: "Pra avançar envie localização da cidade do RJ",
                                          style: .alert)
            
        case .thirdLocationNotAdded:
            return Alert(delegate: vc).getAlert(title: "Adicione outra localização",
                                          message: "Pra avançar envie outra localização de outra cidade",
                                          style: .alert)
        case.thirdNeedDistanceBetweenLocation:
            return Alert(delegate: vc).getAlert(title: "Calcule a distância",
                                                                     message: "Pra avançar atribua a distância a varíavel totalDistance entre as duas localizações (firstLocation e firstLocation)",
                                                                     style: .alert)
        case .thidCompleteFinalTask:
            return Alert(delegate: vc).getAlert(title: "Tarefa Final",
                                          message: "A distância calculada foi calculada Parabéns clique em dismiss e vá para a página final",
            style: .alert) { _ in
                vc.performSegue(withIdentifier: "phaseFinal", sender: nil)
            }
        
        }
    }
    
    func presenterAlert(alert: UIAlertController) {
        delegate?.present(alert, animated: true, completion: nil)
    }
    
}
