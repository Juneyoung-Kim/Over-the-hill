//
//  NoteViewController.swift
//  OverTheHill
//
//  Created by Juneyoung Kim on 2020-03-31.
//  Copyright © 2020 Juneyoung Kim. All rights reserved.
//

import UIKit
import RealmSwift

class NoteViewController: UIViewController {

    @IBOutlet weak var noteTexts: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func addNotes(_ sender: UIButton) {
        let realm = try! Realm()
        let note = Note()
        
        note.title = ""
        note.content = noteTexts.text
        
        do {
            try realm.write {
                realm.add(note)
                print(note)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func cancelNotes(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
