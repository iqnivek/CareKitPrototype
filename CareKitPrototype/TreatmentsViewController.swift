//
//  TreatmentsViewController.swift
//  CareKitPrototype
//
//  Created by Kevin Qi on 5/3/16.
//  Copyright © 2016 PatientsLikeMe. All rights reserved.
//

import UIKit

class TreatmentsViewController: UITableViewController {
    var treatments: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TreatmentCell")

        treatments = [
            "Advil",
            "Baclofen",
            "Duolexitine",
        ]
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

        cell.textLabel!.text = treatment
        cell.accessoryType = .Checkmark
        return cell
    }
}