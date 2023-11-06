//
//  CustomTableViewController.swift
//  Runner
//
//  Created by HuyNQ on 06/11/2023.
//

import UIKit

class CustomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the table view
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30 // Adjust the number of rows as needed
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        cell.textLabel?.textColor = UIColor.black // Set text color to black
        return cell
    }
}
