//
//  ContactsTableViewController.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class ContactsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ContactDataManagerDelegate {

  // MARK: - Properties

  let group : String = "Contact"

  let dataManager : ContactDataManager = ContactDataManager.shared

  var detailViewController : ContactViewController!

  // MARK: - Outlets

  @IBOutlet weak var tableView: UITableView!

  // MARK: - UIViewController Overrides

  override func viewDidLoad() {
    super.viewDidLoad()
    self.dataManager.delegate = self
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
    let dvc = segue.destination as! ContactViewController
    dvc.tableViewController = self
  }

  // MARK: - UITableViewDataSource Methods

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(self.group)Cell") else {
        return UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "\(self.group)Cell")
      }
      return cell
    }()

    let object = self.dataManager.array[indexPath.row]
    cell.textLabel?.text = object.name
    cell.detailTextLabel?.text = "A subtitle here"
    return cell
  }

  // MARK: - UITableViewDelegate Methods

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.dataManager.object = self.dataManager.array[indexPath.row]
    self.performSegue(withIdentifier: "show\(self.group)", sender: self)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataManager.array.count
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    self.removeObject(indexPath: indexPath)
  }

  // MARK: - ContactDataManager Methods

  func dataManagerDidUpdate() {
    self.tableView.reloadData()
  }

  // MARK: - ContactsTableViewController (self) Methods

  func addObject() {
    self.dataManager.insertNewObject()
    self.performSegue(withIdentifier: "show\(self.group)", sender: self)
  }

  func removeObject(indexPath: IndexPath) {
    self.dataManager.array.remove(at: indexPath.row)
    self.tableView.reloadData()
  }

}
