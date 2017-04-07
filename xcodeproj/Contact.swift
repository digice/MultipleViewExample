//
//  Contact.swift
//  MultiView
//
//  Created by Digices LLC on 4/7/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import Foundation

class Contact : NSObject, NSCoding {

  var id : Int

  var name : String

  override init() {
    self.id = 0
    self.name = ""
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {

    self.id = aDecoder.decodeInteger(forKey: "id")

    self.name = aDecoder.decodeObject(forKey: "name") as! String

  }

  func encode(with aCoder: NSCoder) {

    aCoder.encode(self.id, forKey: "id")

    aCoder.encode(self.name, forKey: "name")

  }

}
