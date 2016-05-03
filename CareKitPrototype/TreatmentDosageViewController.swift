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

        view.addSubview(DosagePickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))
    }
}
