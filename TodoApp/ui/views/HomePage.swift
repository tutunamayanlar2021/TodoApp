//
//  ViewController.swift
//  TodoApp
//
//  Created by Kader Oral on 1.08.2023.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var toDosTableView: UITableView!
    
    var todosList = [Todo]()
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self //searcBar'ı yetkilendiriyoruz.
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        
        _ = viewModel.todosList.subscribe(onNext: { liste in
            self.todosList = liste
            self.toDosTableView.reloadData()
            
        })

        }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadTodos()// SAYFA HER GÖRÜNDÜGÜ ZAMAN CALİSİR
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
//MARK: - UISearchBarDelegate
extension HomePage: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchFor: searchText)
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension HomePage: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todosList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        cell.labelTodoName.text = todo.todo_name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todosList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)//seçileni kaldırma

    }
    
    // left - start - leading
    // right - end - trailing
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextual,view,bool in
            let todo = self.todosList[indexPath.row]
            
            let alert = UIAlertController(title: "delete process", message: "Delete  \(todo.todo_name!)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){
                action in
                self.viewModel.delete(todo_id: todo.todo_id!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}

