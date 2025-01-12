//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var animalSections = [[ZooAnimal]]()  {
        didSet  {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animalSections = ZooAnimal.getZooAnimals()
        tableView.dataSource = self
        tableView.delegate = self
    }
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
}

extension ViewController: UITableViewDataSource, UITableViewDelegate   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //switch that lets you return the number of rows per section
        return animalSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            fatalError("tableView error protocol conform")
        }
        
        let animal = animalSections[indexPath.section][indexPath.row]
        
        cell.configureCell(for: animal)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSections[section].first?.classification
    }
    
}

