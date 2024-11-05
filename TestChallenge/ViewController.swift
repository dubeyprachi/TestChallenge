//
//  ViewController.swift
//  TestChallenge
//
//  Created by Prachi Dubey on 3/11/2024.
//

import UIKit

enum Constants {
    static let title = "Dog Facts"
    static let dogUrl = "https://dog-api.kinduff.com/api/facts?number=10"
    static let cellIdentifier = "Cell"
}

enum IdentifierString {
    static let tableView = "tableView"
}

protocol DisplayLogic: AnyObject {
    func displayFactsOfDog(with facts: [String])
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var dogFacts: [String] = []
    var interactor: BusinessLogic?
    var presenter: PresentationLogic?
    var router: RoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = Constants.title
        tableView.accessibilityIdentifier = IdentifierString.tableView
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: Constants.cellIdentifier)
        configurePattern()
        getData()
    }
    
    func configurePattern() {
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        let controller = self
        
        interactor.presenter = presenter
        presenter.controller = controller
        controller.router = router
        
        self.interactor = interactor
        self.presenter = presenter
    }
    
    func getData() {
        //Calls Interactor
        interactor?.getFactsOfDog(from: Constants.dogUrl)
    }
}

extension ViewController: DisplayLogic {
    func displayFactsOfDog(with facts: [String]) {
        self.dogFacts = facts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //UITableView Delegate and DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as UITableViewCell
        
        var config = UIListContentConfiguration.cell()
        config.text = dogFacts[indexPath.row]
        cell.contentConfiguration = config
        
        return cell
    }
}
