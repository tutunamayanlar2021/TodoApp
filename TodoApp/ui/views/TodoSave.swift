//
//  TodoSave.swift
//  TodoApp
//
//  Created by Kader Oral on 3.08.2023.
//

import UIKit

class TodoSave: UIViewController {

    @IBOutlet weak var tfTodoName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ButtonSave(_ sender: Any) {
        if let tdName = tfTodoName.text,var tdTime = Date().displayFormat{
            save( todo_name: tdName,todo_time: tdTime)
        }
    }
    
    func save(todo_name:String,todo_time: String){
        print("Todo save: \(todo_name)-\(todo_time) ")
    }
    
    
}
