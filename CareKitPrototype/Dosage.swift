//
//  Dosage.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/4/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import Foundation

class Dosage {
    var counts: [String]
    var dosages: [String]
    var schedules: [String]

    var selectedCount: Int = 0
    var selectedDosage: Int = 0
    var selectedSchedule: Int = 0

    init(counts: [String] = [], dosages: [String] = [], schedules: [String] = []) {
        self.counts = counts
        self.dosages = dosages
        self.schedules = schedules
    }
}