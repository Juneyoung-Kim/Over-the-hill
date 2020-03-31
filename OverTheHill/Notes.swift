//
//  Notes.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-03-30.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import Foundation
import RealmSwift


class Note: Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
}

