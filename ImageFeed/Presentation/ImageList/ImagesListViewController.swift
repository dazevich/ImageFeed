//
//  ViewController.swift
//  ImageFeed
//
//  Created by Даниил Азевич on 17.04.2024.
//

import UIKit

class ImagesListViewController: UIViewController {
    
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}


extension ImagesListViewController: UITableViewDelegate {
    
}

extension ImagesListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
