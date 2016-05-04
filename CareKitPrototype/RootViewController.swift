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
        self.createCarePlanActivities(store!)

        self.viewControllers = [
            UINavigationController(rootViewController: createCareCardViewController()),
            UINavigationController(rootViewController: createSymptomTrackerViewController())
        ]
    }

    func showTreatments() {
        let treatmentsVC = TreatmentsViewController()
        treatmentsVC.title = "Treatments"
        let navigationVC = UINavigationController(rootViewController: treatmentsVC)
        self.presentViewController(navigationVC, animated: true, completion: nil)
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
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: #selector(RootViewController.showTreatments))
        return viewController

    }

    private func createSymptomTrackerViewController() -> OCKSymptomTrackerViewController {
        let viewController = OCKSymptomTrackerViewController(carePlanStore: store!)
        // viewController.delegate = self
        viewController.title = NSLocalizedString("Symptom Tracker", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named: "second"), selectedImage: UIImage(named: "second"))
        return viewController
    }

    private func createCarePlanActivities(carePlanStore: OCKCarePlanStore) {
        let activities = [
            OCKCarePlanActivity.interventionWithIdentifier(
                "baclofen",
                groupIdentifier: nil,
                title: NSLocalizedString("Baclofen", comment: ""),
                text: NSLocalizedString("20 mg, twice a day", comment: ""),
                tintColor: UIColor(red: 0x9B / 255.0, green: 0x59 / 255.0, blue: 0xB6 / 255.0, alpha: 1.0),
                instructions: NSLocalizedString("Take 2 mg baclofen", comment: ""),
                imageURL: nil,
                schedule: OCKCareSchedule.weeklyScheduleWithStartDate(NSDateComponents(year: 2016, month: 01, day: 01), occurrencesOnEachDay: [2, 4, 2, 4, 2, 4, 2]),
                userInfo: nil
            )
        ]

        for activity in activities {
            carePlanStore.addActivity(activity) { success, error in
                if !success {
                    print(error?.localizedDescription)
                }
            }
        }
    }
}
