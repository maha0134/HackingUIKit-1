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
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		
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
	
	@objc func shareTapped() {
		guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let imageName = selectedImage else {
			print("No image found")
			return
		}

		let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}

}
