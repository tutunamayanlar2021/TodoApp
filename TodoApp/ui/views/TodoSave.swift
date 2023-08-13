//
//  TodoSave.swift
//  TodoApp
//
//  Created by Kader Oral on 3.08.2023.
//

import UIKit

class TodoSave: UIViewController {

    @IBOutlet weak var tfTodoName: UITextField!
    var viewModel = TodoSaveViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ButtonSave(_ sender: Any) {
        if let tdName = tfTodoName.text{
            viewModel.save( todo_name: tdName)
        }
    }
    
   
    
    
}
