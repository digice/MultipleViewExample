//
//  ContactDataManager.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol ContactDataManagerDelegate {
  func dataManagerDidUpdate()
}

class ContactDataManager {

  // MARK : - Properties

  static let shared : ContactDataManager = ContactDataManager()

  let group : String = "contact"

  var delegate : ContactDataManagerDelegate?

  var array : [Contact]

  var object : Contact?
  
  // MARK : - Methods
  
  private init() {

    if let storedData = UserDefaults.standard.object(forKey: "\(self.group)s") as? Data {
      self.array = (NSKeyedUnarchiver.unarchiveObject(with: storedData) as? [Contact])!
    } // ./data found in defaults

    else {
      self.array = []
    } // ./no data in defaults

  } // ./init

  func save() {

    let ud = UserDefaults.standard

    let dataToSave = NSKeyedArchiver.archivedData(withRootObject: self.array)

    ud.set(dataToSave, forKey: "\(self.group)s")

    ud.synchronize()

  } // ./save

  func sortArray() {

    if self.array.count > 1 {
      self.array.sort { $0.name < $1.name }
    }

    self.save()

    if let d = self.delegate {
      d.dataManagerDidUpdate()
    }

  } // ./sortArray

  func insertNewObject() {

    self.object = Contact()

    self.array.insert(self.object!, at: 0)

    if let d = self.delegate {
      d.dataManagerDidUpdate()
    }

  } // ./insertNewObject

}
