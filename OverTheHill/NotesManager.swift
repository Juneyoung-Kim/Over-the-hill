//
//  NotesManager.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-03-30.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import UIKit
import RealmSwift

class NotesManager: NSObject {

    static let shared = NotesManager()
    
    private override init() {
        super.init()
        
    }
    
   func addNotes (_ title:String) {
        let realm = try! Realm()
        
    }
    
    func getNotes() -> [NotesForPros]?{
        let realm = try! Realm()
      
    }
    
    func addNote (_ notebook:NotesForPros, content contentString:String) {
        let realm = try! Realm()
        
    }
    
    func updateNote (_ note:NoteP, newContent content:String) {
        let realm = try! Realm()
        
    
    }
    
    func deleteNote (_ note:NoteP) {
        let realm = try! Realm()
        
     
    }
    
    
    func getNotes (_ notebook:NotesForPros) -> [Note]? {
      
    }
    
    
    
}
