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
    var viewModel = TodoDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = todo{
            tfToDoName.text = td.todo_name
        }
        
    }

    @IBAction func buttonUpdate(_ sender: Any) {
        if let tName=tfToDoName.text,  let td=todo{
            viewModel.update(todo_id: td.todo_id!, todo_name: tName )
        }
    }
    

}
