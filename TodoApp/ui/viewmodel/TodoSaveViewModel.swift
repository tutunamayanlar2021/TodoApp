//
//  TodoSaveViewModel.swift
//  TodoApp
//
//  Created by Kader Oral on 13.08.2023.
//

import Foundation

class TodoSaveViewModel{
    var trepo = TodoDaoRepository()
    
    func save(todo_name:String){
        trepo.save(todo_name: todo_name)
        
    }
    
}
