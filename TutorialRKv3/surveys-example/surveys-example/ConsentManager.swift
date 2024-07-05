//
//  ConsentManager.swift
//  surveys-example
//
//  Created by Juan David López Regalado on 12/06/24.
//

import Foundation
import UIKit
import ResearchKit

class ConsentManager{
    static let shared = ConsentManager()
    
    func createConsentTask() -> ORKTask{
        
        // Pagina de Welcome
        let welcomeStep = ORKInstructionStep(identifier: "consentWelcomeInstructionStep")
        welcomeStep.title = "Welcome!"
        welcomeStep.iconImage = UIImage(systemName: "hand.wave")
        welcomeStep.detailText = "Thank you for being part of the biomarker project aimed at determining the level of sedentary lifestyle. However, before accepting, please read the next part." // explain the consent
        
        let sign = ORKInstructionStep(identifier: "signAccept")
        sign.title = "Please Sign if you Accept"

        
        // Pagina del before you join
        let beforeYouJoin = ORKInstructionStep(identifier: "informedConsentInstructionStep")
        beforeYouJoin.iconImage = UIImage(systemName: "doc.text.magnifyinglass")
        beforeYouJoin.title = "Before You Join"
        
        let sharingHealthDataBodyItem = ORKBodyItem(text: "The study will ask you to share some of your Health data.",
                                                    detailText: nil,
                                                    image: UIImage(systemName: "heart.fill"),
                                                    learnMoreItem: nil,
                                                    bodyItemStyle: .image)
                
        let completingTasksBodyItem = ORKBodyItem(text: "You will be asked to complete various tasks over the duration of the study.",
                                                  detailText: nil,
                                                  image: UIImage(systemName: "checkmark.circle.fill"),
                                                  learnMoreItem: nil,
                                                  bodyItemStyle: .image)
                
        let signatureBodyItem = ORKBodyItem(text: "Before joining, we will ask you to sign an informed consent document.",
                                            detailText: nil,
                                            image: UIImage(systemName: "signature"),
                                            learnMoreItem: nil,
                                            bodyItemStyle: .image)
        
        let secureDataBodyItem = ORKBodyItem(text: "Your data is kept private and secure.",
                                             detailText: nil,
                                             image: UIImage(systemName: "lock.fill"),
                                             learnMoreItem: nil,
                                             bodyItemStyle: .image)
                
        beforeYouJoin.bodyItems = [
            sharingHealthDataBodyItem,
            completingTasksBodyItem,
            signatureBodyItem,
            secureDataBodyItem
        ]
        
        
        let instructionSteps = [sign]
        
        let webViewStep = ORKWebViewStep(identifier: "WebViewStepIdentifier", instructionSteps:instructionSteps)
        webViewStep.showSignatureAfterContent = true
        

        let task = ORKOrderedTask(identifier: "ConsentTask", steps: [welcomeStep, beforeYouJoin, webViewStep,  /*other steps*/])
    
        return task
        
        
    }
    
    
    
}
