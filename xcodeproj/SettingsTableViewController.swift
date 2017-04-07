//
//  SettingsTableViewController.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class SettingsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  let group : String = "Setting"

  var detailViewController : SettingViewController!

  // MARK: - Outlets

  @IBOutlet weak var tableView: UITableView!

  // MARK: - UIViewController Overrides

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "\(self.group)s"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addObject))
    self.navigationItem.leftBarButtonItem = self.editButtonItem
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    self.tableView.setEditing(editing, animated: animated)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: self)
    let dvc = segue.destination as! SettingViewController
    dvc.tableViewController = self
  }

  // MARK: - UITableViewDataSource Methods

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(self.group)Cell")!
    cell.textLabel?.text = self.group
    return cell
  }

  // MARK: - UITableViewDelegate Methods

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "show\(self.group)", sender: self)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    self.removeObject(atIndexPath: indexPath)
  }
  // MARK: - ContactsTableViewController (self) Methods

  func addObject() {

  }

  func removeObject(atIndexPath: IndexPath) {

  }

}
