//
//  ViewController.swift
//  TableViewEx
//
//  Created by Eunchan Kim on 2022/10/25.
//

import UIKit

class ViewController: UIViewController {

    let flags = ["ec", "sn", "nl", "qa", "gb-wls", "ir", "us", "gb-eng", "sa", "pl", "mx", "ar", "au", "tn", "dk", "fr", "cr", "jp", "de", "es", "ca", "ma", "hr", "be", "cm", "rs", "ch", "br", "gh", "kr", "uy", "pt"]

    let country = ["Ecuador", "Senegal", "Netherlands", "Qatar", "Wales", "Iran", "USA", "England", "Saudi Arabia", "Poland", "Mexico", "Argentina", "Australia", "Tunisia", "Denmark", "France", "Costa Rica", "Japan", "Germany", "Spain", "Canada", "Morocco", "Croatia", "Belgium", "Cameroon", "Serbia", "Switzerland", "Brazil", "Ghana", "South Korea", "Uruguay", "Portugal"]

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        guard let cell1 = cell else {fatalError()}
        
        var content = cell1.defaultContentConfiguration()
        content.text = country[indexPath.row]
        content.secondaryText = flags[indexPath.row]
        content.image = UIImage(named: flags[indexPath.row])
        content.imageProperties.maximumSize.height = 80
        content.imageProperties.maximumSize.width = 100
        
        cell1.contentConfiguration = content
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        label.text = country[indexPath.row]
    }
    
}
extension ViewController: UITableViewDelegate{
    
}
