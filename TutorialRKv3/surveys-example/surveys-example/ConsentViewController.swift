//
//  ConsentViewController.swift
//  surveys-example
//
//  Created by Juan David López Regalado on 02/07/24.
//
import UIKit
import ResearchKit
import ResearchKitUI

class ConsentViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    @IBOutlet weak var startForm: UIButton!
    
    var consentCompleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startForm.isEnabled = false  // Inicialmente deshabilitamos el botón

    }
    
    @IBAction func startConsent(_ sender: Any) {

    let consentTask = ConsentManager.shared.createConsentTask()
        let taskViewController = ORKTaskViewController(task: consentTask, taskRun: nil)
        
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
        
        if reason == .completed {
                    consentCompleted = true
                    startForm.isEnabled = true  // Habilitamos el botón si el consentimiento se completó correctamente
            
                } else {
                    consentCompleted = false
                    startForm.isEnabled = false  // Mantenemos el botón deshabilitado si no se completó el consentimiento
                }
    }
}


