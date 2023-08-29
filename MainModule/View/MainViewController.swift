//
//  MainViewController.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 22.07.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getCocktails()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "text"
        return cell
    }
    
    
}

extension MainViewController: MainViewProtocol {
    func success() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
 
}
