//
//  ToDo.swift
//  TodoApp
//
//  Created by Kader Oral on 1.08.2023.
//

import Foundation

class Todo{
    var todo_id: Int?
    var todo_name: String?
    var creationDate: String?
    
    init() {
    }
    init(todo_id: Int, todo_name: String,creationDate: String?) {
        self.todo_id = todo_id
        self.todo_name = todo_name
        self.creationDate = creationDate
    }
    
    
}
