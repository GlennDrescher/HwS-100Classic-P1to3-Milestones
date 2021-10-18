//
//  ViewController.swift
//  HwS-100Classic-P1to3-Milestones
//
//  Created by Glenn Drescher on 16/10/2021.
//

import UIKit

class FlagsListVC: UITableViewController {
    public var flagsFiles: [String] = []
    var flagsAssets = ["spain", "nigeria", "ireland", "germany", "italy", "poland", "russia", "estonia", "monaco", "france", "us", "uk"]
    let sections = ["Files", "Assets"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadFlagsFiles()
        
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.title = "Flags"
    }
    
    func loadFlagsFiles(){
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try? fm.contentsOfDirectory(atPath: path)
        
        for item in items! {
            if (item.hasSuffix("jpg") && item.hasPrefix("nssl")) {
                flagsFiles.append(item)
            }
        }
        flagsFiles.sort()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FlagsDetail") as? FlagsDetailVC {
            switch indexPath.section {
            case 0:
                vc.selectedFlag = flagsFiles[indexPath.row]
            case 1:
                vc.selectedFlag = flagsAssets[indexPath.row]
            default: print("Error: Out of Index")
            }
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return flagsFiles.count
        } else if (section == 1) {
            return flagsAssets.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell")!
        if (indexPath.section == 0) {
            cell.textLabel?.text = flagsFiles[indexPath.row]
            cell.imageView?.image = UIImage(named: flagsFiles[indexPath.row])
        } else if (indexPath.section == 1) {
            cell.textLabel?.text = flagsAssets[indexPath.row]
            cell.imageView?.image = UIImage(named: flagsAssets[indexPath.row])
        }
        
        return cell
    }


}

