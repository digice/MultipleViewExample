//
//  SettingViewController.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, SettingDataManagerDelegate {

  // MARK: - Outlets

  @IBOutlet weak var idLabel: UILabel!

  @IBOutlet weak var nameField: UITextField!

  @IBOutlet weak var saveButton: UIButton!

  // MARK: - Properties

  var tableViewController : SettingsTableViewController!

  let dataManager : SettingDataManager = SettingDataManager.shared

  // MARK: - UIViewController Overrides

  override func viewDidLoad() {
    super.viewDidLoad()
    self.updateViewFromData()
  }

  override func didReceiveMemoryWarning() {

    super.didReceiveMemoryWarning()

  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    super.prepare(for: segue, sender: self)
    tableViewController.detailViewController = self

  }

  // MARK: SettingViewController (self) Methods

  func updateViewFromData() {

//    if let obj = self.dataManager.object {
//
//
//    }

  }

  func updateDataFromView() {

  }

  // MARK: SettingDataManager Delegate Methods

  func dataManagerDidUpdate() {
    self.updateViewFromData()
  }

  // MARK: - Actions

  @IBAction func doneEditing(_ sender: Any) {

    self.updateDataFromView()
    self.dataManager.sortArray()
    self.dataManager.save()
    self.tableViewController.tableView.reloadData()
    self.navigationController?.popViewController(animated: true)

  }

}
