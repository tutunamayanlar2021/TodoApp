//
//  TodoSave.swift
//  TodoApp
//
//  Created by Kader Oral on 3.08.2023.
//

import UIKit

class TodoSave: UIViewController {

    @IBOutlet weak var tfToDoId: UITextField!
    @IBOutlet weak var tfToDoName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ButtonSave(_ sender: Any) {
        if let tdId = tfToDoId.text, let tdName = tfToDoName.text{
            save(todo_id: Int(tdId)!, todo_name: tdName)
        }
    }
    
    func save(todo_id:Int,todo_name:String){
        print("Todo save: \(todo_id) - \(todo_name)")
    }
    
    
}
