//
//  DetailViewController.swift
//  project1
//
//  Created by AKSHAY MAHAJAN on 2023-05-14.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView!
	var selectedImage: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		if let selectedImage {
			imageView.image = UIImage(named: selectedImage)
		}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
