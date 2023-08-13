//
//  TodoDaoRepository.swift
//  TodoApp
//
//  Created by Kader Oral on 13.08.2023.
//

import Foundation
import RxSwift

class  TodoDaoRepository{
    var todosList = BehaviorSubject<[Todo]>(value: [Todo]())
    func save(todo_name:String){
        print("Todo Save: \(todo_name) ")
    }
    
    func update(todo_id:Int,todo_name:String){
        print("Todo Update: \(todo_name)")
    }
    
    func delete(todo_id:Int){
        print("Todo Sil :  \(todo_id)")
    }
    
    func search(searchFor:String){
        print("Todo Ara : \(searchFor)")
    }
    
    func uploadTodos()
    {
        var list = [Todo]()
        
        let t1 = Todo(todo_id: 1, todo_name: "Do homework")
        let t2 = Todo(todo_id: 2, todo_name: "Go shopping")
        let t3 = Todo(todo_id: 3, todo_name: "Complete task")
        
        list.append(t1)
        list.append(t2)
        list.append(t3)
        
        todosList.onNext(list)//Tetikleme
        
    }
    
}
