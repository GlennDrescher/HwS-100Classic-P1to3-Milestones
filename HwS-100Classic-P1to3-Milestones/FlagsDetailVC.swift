//
//  FlagsDetailVC.swift
//  HwS-100Classic-P1to3-Milestones
//
//  Created by Glenn Drescher on 18/10/2021.
//

import UIKit

class FlagsDetailVC: UIViewController {
    @IBOutlet var flagImage: UIImageView!
    var selectedFlag: String = "Flag"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = selectedFlag
        navigationItem.largeTitleDisplayMode = .never
        
        flagImage.image = UIImage(named: selectedFlag)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    @objc func shareTapped() {
        guard let image = flagImage.image?.jpegData( compressionQuality: 0.8) else {
            print("No Image Found")
            return }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    

}
