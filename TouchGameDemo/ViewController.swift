//
//  ViewController.swift
//  TouchGameDemo
//
//  Created by nier on 2021/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var numberOfElement: Int = 49
    var selectedIndex: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize.width = self.view.frame.width / 5
        
        collectionView.collectionViewLayout = layout
        
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfElement
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.label.text = String(indexPath.row + 1)
        cell.indexOfCell = indexPath.row
        cell.isSelected = false
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let indexPath = selectedIndex {
            let previousCell = collectionView.cellForItem(at: indexPath)
            previousCell?.isSelected = false
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        cell?.isSelected = true
        
        selectedIndex = indexPath
    }
}
