//
//  KisilerHucre.swift
//  TodoApp
//
//  Created by Kader Oral on 7.08.2023.
//

import UIKit

class TodoCell: UITableViewCell {
    
    @IBOutlet weak var labelTodoName: UILabel!
    
    @IBOutlet weak var labelTodoDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
