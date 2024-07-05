//
//  FormViewController.swift
//  surveys-example
//
//  Created by Juan David López Regalado on 02/07/24.
//

import UIKit
import ResearchKit
import ResearchKitUI

class FormViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    @IBOutlet weak var startActivities: UIButton!
    
    var formCompleted = false  // Variable que controla si el consentimiento se ha completado
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startActivities.isEnabled = false  // Inicialmente deshabilitamos el botón

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startForm(_ sender: Any) {
        
        let taskViewController = ORKTaskViewController(task: SurveyManager.shared.createSurveyTask(), taskRun: nil)
               taskViewController.delegate = self
               present(taskViewController, animated: true, completion: nil)
        
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskFinishReason, error: (any Error)?) {
        taskViewController.dismiss(animated: true, completion: nil)
        

        if reason == .completed {
                    formCompleted = true
                    startActivities.isEnabled = true  // Habilitamos el botón si el consentimiento se completó correctamente
                } else {
                    formCompleted = false
                    startActivities.isEnabled = false  // Mantenemos el botón deshabilitado si no se completó el consentimiento
                }
            }
        }
