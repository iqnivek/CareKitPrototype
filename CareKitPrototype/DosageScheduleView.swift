//
//  DosageScheduleView.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/4/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit

class DosageScheduleView: UIView {
    let options = ["Once a day", "Twice a day", "Three times a day"]

    let picker = UIPickerView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        picker.dataSource = self
        picker.delegate = self
        self.addSubview(picker)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DosageScheduleView: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
}

extension DosageScheduleView: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // TODO
    }
}