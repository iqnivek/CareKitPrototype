//
//  Dosage.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/4/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import Foundation
import RealmSwift

class DosageCount: Object {
    dynamic var label: String = ""
}

class DosageType: Object {
    dynamic var label: String = ""
}

class DosageSchedule: Object {
    dynamic var label: String = ""
}

class Dosage: Object {
    dynamic var treatment: Treatment?

    let counts = List<DosageCount>()
    let types = List<DosageType>()
    let schedules = List<DosageSchedule>()

    dynamic var selectedCount: Int = 0
    dynamic var selectedDosage: Int = 0
    dynamic var selectedSchedule: Int = 0
}