//
//  DosagePickerView.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit
import RealmSwift

class DosagePickerView: UIView {
    var dosage: Dosage
    let picker = UIPickerView()

    override init(frame: CGRect) {
        dosage = Dosage()
        super.init(frame: frame)

        picker.dataSource = self
        picker.delegate = self
        self.addSubview(picker)
    }

    convenience init(frame: CGRect, dosage: Dosage) {
        self.init(frame: frame)

        self.dosage = dosage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DosagePickerView: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return dosage.counts.count
        case 1:
            return dosage.types.count
        default:
            return 0
        }
    }
}

extension DosagePickerView: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return dosage.counts[row].label
        case 1:
            return dosage.types[row].label
        default:
            return nil
        }
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            dosage.selectedCount = row
        case 1:
            dosage.selectedDosage = row
        default:
            break
        }
    }
}