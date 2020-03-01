//
//  DetailViewController.swift
//  IstanbulLandmarks
//
//  Created by Halil Özel on 1.03.2020.
//  Copyright © 2020 Halil Özel. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    @IBOutlet weak var detailMapView: MKMapView!
    
    var sentTitle : String!
    var sentDescription : String!
    var sentImage : String!
    var sentLatitude : String!
    var sentLongitude : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = sentTitle
        
        detailTitle.text = sentTitle
        
        detailDescription.text = sentDescription
        detailImage.image = UIImage(named: sentImage)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(sentLatitude)!, longitude: Double(sentLongitude)!), span: span)
        detailMapView.setRegion(region, animated: true)
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(sentLatitude)!, Double(sentLongitude)!)
        
        let pinAnnotation = MKPointAnnotation()
        pinAnnotation.coordinate = pinLocation
        pinAnnotation.title = sentTitle
        
        self.detailMapView.addAnnotation(pinAnnotation)
    }
    
    
    
    @IBAction func directions(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://maps.apple.com/maps?daddr=\(Double(sentLatitude)!),\(Double(sentLongitude)!)")!, options: [:], completionHandler: nil)
        
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
