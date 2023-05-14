//
//  ViewController.swift
//  project1
//
//  Created by AKSHAY MAHAJAN on 2023-05-14.
//

import UIKit

class ViewController: UITableViewController {
	var pictures = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let fm = FileManager.default
		//iOS apps ALWAYS have a resource path
		let path = Bundle.main.resourcePath!
		
		//We should always be able to read the app's resource path
		let items = try! fm.contentsOfDirectory(atPath: path)
		
		for item in items {
			if item.hasPrefix("nssl") {
				//this is a picture to load!
				pictures.append(item)
			}
		}
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}
}

