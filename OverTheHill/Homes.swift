//
//  Homes.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-03-23.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import Foundation
import RealmSwift

class Homes: Object {
    @objc dynamic var BUSINESS_NAME = ""
    @objc dynamic var TYPE = ""
    @objc dynamic var CITY = ""
    @objc dynamic var POSTAL_CODE = ""
    @objc dynamic var BUSINESS_PHONE = ""
    @objc dynamic var SENIOR_ASSISTED_LIVING = ""
    @objc dynamic var SENIOR_PUBLIC_UNITS = ""
    
    let notes: Note? = Note()
}


