//
//  RootViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit
import CareKit

class RootViewController: UITabBarController {
    private var store: OCKCarePlanStore? = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.store = self.createCarePlanStore()

        self.viewControllers = [
            UINavigationController(rootViewController: createCareCardViewController()),
            UINavigationController(rootViewController: createSymptomTrackerViewController())
        ]
    }

    private func createCarePlanStore() -> OCKCarePlanStore {
        let persistenceDirectoryURL = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)[0])

        if !NSFileManager.defaultManager().fileExistsAtPath(persistenceDirectoryURL.absoluteString, isDirectory: nil) {
            try! NSFileManager.defaultManager().createDirectoryAtURL(persistenceDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        }

        return OCKCarePlanStore(persistenceDirectoryURL: persistenceDirectoryURL)
    }

    private func createCareCardViewController() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: store!)
        viewController.title = NSLocalizedString("Care Card", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named: "first"), selectedImage: UIImage(named: "first"))
        return viewController
    }

    private func createSymptomTrackerViewController() -> OCKSymptomTrackerViewController {
        let viewController = OCKSymptomTrackerViewController(carePlanStore: store!)
        // viewController.delegate = self
        viewController.title = NSLocalizedString("Symptom Tracker", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named: "second"), selectedImage: UIImage(named: "second"))
        return viewController
    }
}
