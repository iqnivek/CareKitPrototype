//
//  TreatmentsViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import RealmSwift
import UIKit

class TreatmentsViewController: UITableViewController {
    let realm = try! Realm()

    var treatments: [Treatment] {
        get {
            return Array(realm.objects(Treatment))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TreatmentCell")

        // TODO extract into data loading process
        let t1 = Treatment(value: [
            "name": "Baclofen"
        ])
        let d1 = Dosage(value: [
            "counts": (1...10).map { ["label": "\($0)"] },
            "types": [["label": "20 mg capsule"], ["label": "100 mg pill"]],
            "schedules": [["label": "Once a day"], ["label": "Twice a day"], ["label": "Three times a day"]]
        ])
        d1.treatment = t1

        realm.beginWrite()
        realm.add(t1)
        realm.add(d1)
        try! realm.commitWrite()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treatments.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let treatment = treatments[indexPath.row]

        let cell = tableView.dequeueReusableCellWithIdentifier("TreatmentCell")! as UITableViewCell

        cell.textLabel!.text = treatment.name
        cell.accessoryType = .Checkmark
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TreatmentDosageViewController") as! TreatmentDosageViewController
        vc.title = "Dosage"
        vc.dosage = realm.objects(Dosage).filter("treatment == %@", treatments[indexPath.row]).first!
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
