//
//  TodoDetail.swift
//  TodoApp
//
//  Created by Kader Oral on 1.08.2023.
//

import UIKit

class TodoDetail: UIViewController {
    
    @IBOutlet weak var tfToDoId: UITextField!
    
    @IBOutlet weak var tfToDoName: UITextField!
    
    
    var todo:Todo?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = todo{
            tfToDoId.text = td.todo_id?.formatted()
            tfToDoName.text = td.todo_name
        }
        
    }
    
    func update(todo_id:Int, todo_name:String){
        print("Todo Update: \(todo_id) - \(todo_name)")
    }

    @IBAction func buttonUpdate(_ sender: Any) {
        if let tId=tfToDoId.text,let tName=tfToDoName, let td=todo{
            update(todo_id: td.todo_id! , todo_name: td.todo_name!)
        }
    }
    

}
