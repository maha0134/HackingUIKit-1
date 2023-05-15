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
	var selectedImageIndex: Int?
	var totalImages: Int?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.largeTitleDisplayMode = .never

		if let selectedImageIndex, let totalImages {
			title = "Picture \(selectedImageIndex) of \(totalImages)"
		}
		if let selectedImage {
			imageView.image = UIImage(named: selectedImage)
		}
    }
    
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
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
