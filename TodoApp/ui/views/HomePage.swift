//
//  ViewController.swift
//  TodoApp
//
//  Created by Kader Oral on 1.08.2023.
//

import UIKit

class HomePage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonDetailAct(_ sender: Any) {
           let todo = Todo(todo_id: 876, todo_name: "Pzt yapılacaklar")
           performSegue(withIdentifier: "toDetail", sender: todo)
       }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toDetail"{
               if let todo = sender as? Todo{
                   let destinationVC = segue.destination as! TodoDetail
                   destinationVC.todo = todo
               }
           }
       }
}

