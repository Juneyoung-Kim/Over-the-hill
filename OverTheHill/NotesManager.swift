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
        
        let notes = Note()
        notes.title = title
//        notes.content = content
        
        do {
            try realm.write {
                realm.add(notes)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getNotes() -> [Note]?{
        let realm = try! Realm()
        let notebooks = realm.objects(Note.self)
        
        return notebooks.map({$0})
    }
    
    func addNote (_ notebook:Note, content contentString:String) {
        let realm = try! Realm()
        
        let note = Note()
        note.content = contentString
        
//        do {
//            try realm.write {
//                note.Notes.append(note)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }
    
    func updateNote (_ note:Note, newContent content:String) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                note.content = content
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote (_ note:Note) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.delete(note)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
//    func getNotes (_ notebook:Note) -> [Note]? {
//        let notes = note
//        return notes.map({$0})
//    }
    
    
    
    
}
