//
//  HomeCollectionViewController.swift
//  TravelPics
//
//  Created by Juan Meza on 12/30/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

var imagesArray = [UIImage(named:"0")!, UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"3")!, UIImage(named:"4")!, UIImage(named:"5")!, UIImage(named:"6")!, UIImage(named:"7")!, UIImage(named:"8")!, UIImage(named:"9")!, UIImage(named:"10")!, UIImage(named:"11")!, UIImage(named:"0")!, UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"3")!, UIImage(named:"4")!, UIImage(named:"5")!, UIImage(named:"6")!, UIImage(named:"7"), UIImage(named:"8")!, UIImage(named:"9")!, UIImage(named:"10")!, UIImage(named:"11")!]

var namesArray = ["Bora Bora", "Bahamas", "Lisboa", "London", "Dubai", "Portugal", "Japan", "New York", "Canada", "Las Vegas", "Chicago", "Times Square", "Bora Bora", "Bahamas", "Lisboa", "London", "Dubai", "Portugal", "Japan", "New York", "Canada", "Las Vegas", "Chicago", "Times Square"]

class HomeCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "travelCell")

        // Do any additional setup after loading the view.
    }



    @IBAction func openCamera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = true
            picker.delegate = self
            
            present(picker, animated: true)
        } else {
            
            let alert = UIAlertController(title: "Camera Unavailable", message: "You do not hava a camera available on your device", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK Cool", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            let deleteAction = UIAlertAction(title: "Delete?", style: .destructive, handler: { (action) in
                print("deleted")
            })
            
            alert.addAction(deleteAction)
            
            present(alert, animated: true)
            
        }
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return namesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "travelCell", for: indexPath) as! MyCollectionViewCell
    
        // Configure the cell
        cell.nameLabel.text = namesArray[indexPath.row]
        cell.pictureImgView.image = imagesArray[indexPath.row]
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width/4)-10, height: (collectionView.frame.size.width/4))
    }

    @IBAction func close(segue: UIStoryboardSegue) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! FullImageViewController
        
        if let indexPathArray = collectionView?.indexPathsForSelectedItems {
            
            let selectedIndexPath = indexPathArray[0]
            
            let selectedImage = imagesArray[selectedIndexPath.row]
            
            destinationVC.fullImage = selectedImage
        }
    }
}
