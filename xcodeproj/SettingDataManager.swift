//
//  SettingDataManager.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

protocol SettingDataManagerDelegate {
  func dataManagerDidUpdate()
}

class SettingDataManager {

  // MARK : - Properties

  static let shared : SettingDataManager = SettingDataManager()

  let group : String = "setting"

  var delegate : SettingDataManagerDelegate?

  var array : [Any]

  var object : Any?

  // MARK : - Methods

  private init() {

    if let storedData = UserDefaults.standard.object(forKey: "\(self.group)s") as? Data {
      self.array = (NSKeyedUnarchiver.unarchiveObject(with: storedData) as? [Any])!
    } // ./data found in defaults

    else {
      self.array = []
    } // ./no data in defaults

  } // ./init

  func save() {

    self.sortArray()

    let ud = UserDefaults.standard

    let dataToSave = NSKeyedArchiver.archivedData(withRootObject: self.array)

    ud.set(dataToSave, forKey: "\(self.group)s")

    ud.synchronize()

  } // ./save

  func sortArray() {

    if let d = self.delegate {
      d.dataManagerDidUpdate()
    }

  } // ./sortArray

  func insertNewObject() {

    if let d = self.delegate {
      d.dataManagerDidUpdate()
    }

  } // ./insertObject

}
