//
//  TreatmentDosageViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit

class TreatmentDosageViewController: UIViewController {
    let picker = UIPickerView()
    let countOptions = (1...10).map { "\($0)" }
    let dosageOptions = ["20 mg capsule", "100 mg pill"]

    override func viewDidLoad() {
        super.viewDidLoad()

        picker.dataSource = self
        picker.delegate = self
        view.addSubview(picker)
    }
}

extension TreatmentDosageViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return countOptions.count
        case 1:
            return dosageOptions.count
        default:
            return 0
        }
    }
}

extension TreatmentDosageViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return countOptions[row]
        case 1:
            return dosageOptions[row]
        default:
            return nil
        }
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // TODO
    }
}