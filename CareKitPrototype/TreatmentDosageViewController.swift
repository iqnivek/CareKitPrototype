//
//  TreatmentDosageViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit
import RealmSwift

class TreatmentDosageViewController: UIViewController {
    let realm = try! Realm()
    var treatment: Treatment?
    var dosage: Dosage {
        get {
            return realm.objects(Dosage).filter("treatment == %@", self.treatment!).first!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(TreatmentDosageViewController.dismissDosageView))

        let dosagePicker = DosagePickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2), dosage: dosage)
        let dosageSchedule = DosageScheduleView(frame: CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2), dosage: dosage)

        view.addSubview(dosagePicker)
        view.addSubview(dosageSchedule)
    }

    func dismissDosageView() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
