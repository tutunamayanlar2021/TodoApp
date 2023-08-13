//
//  HomePageViewModel.swift
//  TodoApp
//
//  Created by Kader Oral on 13.08.2023.
//

import Foundation
import RxSwift

class HomePageViewModel{
    var trepo = TodoDaoRepository()
    var todosList = BehaviorSubject<[Todo]>(value: [Todo]())
    
    init(){
        todosList = trepo.todosList
    }
    
    func delete(todo_id:Int){
        trepo.delete(todo_id: todo_id)
        uploadTodos()//
    }
    
    func search(searchFor:String){
        trepo.search(searchFor: searchFor )
    }
    
    func uploadTodos()
    {
        trepo.uploadTodos()
        
    }
}
