//
//  TreatmentDosageViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit

class TreatmentDosageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let dosage = Dosage(counts: (1...10).map { "\($0)" }, dosages: ["20 mg capsule", "100 mg pill"], schedules: ["Once a day", "Twice a day", "Three times a day"])
        let dosagePicker = DosagePickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2), dosage: dosage)
        let dosageSchedule = DosageScheduleView(frame: CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2), dosage: dosage)

        view.addSubview(dosagePicker)
        view.addSubview(dosageSchedule)
    }
}
