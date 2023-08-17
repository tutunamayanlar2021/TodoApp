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
    
    let db:FMDatabase?
    
    init(){
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! // simülator üzerinde oluşturcağımız dosyanın yolunu oluşturacağız
        
        let dbURL = URL(fileURLWithPath: filePath).appendingPathComponent("todo.sqlite")//ismiyle erişeceğimiz dosya urlsi
        db = FMDatabase(path: dbURL.path)
    }
    
    func save(todo_name:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO todo (todo_name) VALUES (?)", values: [todo_name])
        }catch{
            
        }
        db?.close()
    }
    
    func update(todo_id:Int,todo_name:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE todo SET todo_name = ? WHERE todo_id = ?", values: [todo_name,todo_id])
        }catch{
            
        }
        db?.close()
    }
    
    func delete(todo_id:Int){
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM todo WHERE todo_id = ?", values: [todo_id])
        }catch{
            
        }
        db?.close()
    }
    
    func search(searchFor:String){
        db?.open()
        
        var list = [Todo]()
        do{
            let result = try db!.executeQuery("SELECT * FROM todo WHERE todo_name like '%\(searchFor)%'", values: nil)
            while result.next(){
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_name = result.string(forColumn: "todo_name")!
                
                let todo = Todo(todo_id: todo_id, todo_name: todo_name)
                
                list.append(todo)
            }
            todosList.onNext(list)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
    }
    
    func uploadTodos()
    {
        
        db?.open()
        
        var list = [Todo]()
        do{
            let result = try db!.executeQuery("SELECT * FROM todo", values: nil)
            while result.next(){
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_name = result.string(forColumn: "todo_name")!
                
                let todo = Todo(todo_id: todo_id, todo_name: todo_name)
                
                list.append(todo)
            }
            todosList.onNext(list)//Tetikleme
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
        
    }
    
}
