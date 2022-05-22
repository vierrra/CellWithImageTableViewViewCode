//
//  CellWithImageTableViewViewController.swift
//  CellWithImage
//
//  Created by Renato Vieira on 21/05/22.
//

import UIKit

class CellWithImageTableViewViewController: UITableViewController {
    
    let data = [("Voltar para home", UIImage(named: "home")),
                ("Contatos", UIImage(named: "contacts")),
                ("Suporte", UIImage(named: "call"))]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.register(CellWithImageTableViewCell.self, forCellReuseIdentifier: CellWithImageTableViewCell.identifier())
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellWithImageTableViewCell.height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellWithImageTableViewCell.identifier(), for: indexPath) as? CellWithImageTableViewCell
        
        cell?.setCell(description: data[indexPath.row].0,
                      icon: data[indexPath.row].1)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell select with row \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UIView {
   public static func identifier() -> String {
        return "\(String(describing: self.self))Identifier"
    }
}

