//
//  TreatmentsViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit

class TreatmentsViewController: UITableViewController {
    var treatments: [[String: AnyObject?]] = [
        ["name": "Advil", "dosage": Dosage(counts: (1...10).map { "\($0)" }, dosages: ["20 mg capsule", "100 mg pill"], schedules: ["Once a day", "Twice a day", "Three times a day"])],
        ["name": "Baclofen", "dosage": Dosage(counts: (1...10).map { "\($0)" }, dosages: ["20 mg capsule", "100 mg pill"], schedules: ["Once a day", "Twice a day", "Three times a day"])],
        ["name": "Duolexitine", "dosage": Dosage(counts: (1...10).map { "\($0)" }, dosages: ["20 mg capsule", "100 mg pill"], schedules: ["Once a day", "Twice a day", "Three times a day"])],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TreatmentCell")
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

        cell.textLabel!.text = treatment["name"] as? String
        cell.accessoryType = .Checkmark
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TreatmentDosageViewController") as! TreatmentDosageViewController
        vc.title = "Dosage"
        vc.dosage = treatments[indexPath.row]["dosage"] as? Dosage
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
