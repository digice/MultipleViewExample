//
//  ContactViewController.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, ContactDataManagerDelegate {

  // MARK: - Outlets

  @IBOutlet weak var idLabel: UILabel!

  @IBOutlet weak var nameField: UITextField!

  @IBOutlet weak var saveButton: UIButton!

  // MARK: - Properties

  var tableViewController : ContactsTableViewController!

  let dataManager : ContactDataManager = ContactDataManager.shared

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

  // MARK: ContactViewController (self) Methods

  func updateViewFromData() {

    if let obj = self.dataManager.object {

      if obj.id != 0 {
        self.idLabel.text = "\(obj.id)"
      }

      self.nameField.text = obj.name

    }

  }

  func updateDataFromView() {

    if let n = self.nameField.text {
      self.dataManager.object!.name = n
      self.dataManager.save()
    }

  }

  // MARK: ContactDataManager Delegate Methods

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
