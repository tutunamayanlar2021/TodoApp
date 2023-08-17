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
        copyDatabase()
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
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")// todo.sqlite'a erişim sağlıyoruz
        
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! // simülator üzerinde oluşturcağımız dosyanın yolunu oluşturacağız
        
        let dbURL = URL(fileURLWithPath: filePath).appendingPathComponent("todo.sqlite")//ismiyle erişeceğimiz dosya urlsi
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: dbURL.path()){
            print("db already exist.")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: dbURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
