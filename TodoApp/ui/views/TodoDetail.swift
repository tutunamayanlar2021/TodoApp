//
//  TodoDetail.swift
//  TodoApp
//
//  Created by Kader Oral on 1.08.2023.
//

import UIKit

class TodoDetail: UIViewController {
    
    @IBOutlet weak var tfToDoName: UITextField!
    
    
    
    var todo:Todo?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = todo{
            tfToDoName.text = td.todo_name
        }
        
    }
    
    func update(todo_id:Int, todo_time:String?, todo_name:String){
        print("Todo Update: \(todo_time!) - \(todo_name)")
    }

    @IBAction func buttonUpdate(_ sender: Any) {
        if let tName=tfToDoName.text,  let td=todo{
            update(todo_id: td.todo_id! ,todo_time:Date().displayFormat, todo_name: tName )
        }
    }
    

}
