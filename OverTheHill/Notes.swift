//
//  Notes.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-03-30.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import Foundation
import RealmSwift

// Individual note for both pros and cons
class NoteP: Object{
    @objc dynamic var prosNote = ""
}

class NoteC: Object {
    @objc dynamic var consNote = ""
}

// Collection of individual notes for both pros and cons
class NotesForPros: Object {
    @objc dynamic let title = "Pros"
    let notesP = List<NoteP>()
}

class NotesForCons: Object {
    @objc dynamic let title = "Cons"
    let notesC = List<NoteC>()
}

