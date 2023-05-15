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
		title = "Storm Viewer"
		navigationController?.navigationBar.prefersLargeTitles = true
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
		pictures.sort()
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		//image name with extension
		let rawImageName = pictures[indexPath.row]
		//remove the extension by splitting the image name at the .
		let imageName = rawImageName.split(separator: ".")[0]
		//convert the SubString into String
		cell.textLabel?.text = String(imageName)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedImage = pictures[indexPath.row]
			vc.totalImages = pictures.count
			vc.selectedImageIndex = indexPath.row + 1
			navigationController?.pushViewController(vc, animated: true)
		}
	}
}

