//
//  MapViewController.swift
//  WorldTrotterProgrammaticUI
//
//  Created by George Mapaya on 2022-12-27.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var selectedSegmentIndex = 0
    
    override func loadView() {
        super.loadView()
        mapView = MKMapView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        mapView.showsUserLocation = true
        
        // MARK: - Create subviews
        
        // Segmented control to switch between map versions
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.selectedSegmentIndex = selectedSegmentIndex
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.addTarget(self, action: #selector(chooseMapVersion(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // MARK: - Add constraints to subviews
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            // segmentedControl
            segmentedControl.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()
        if let userLocation = locationManager.location {
            mapView.setRegion(MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5)), animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.setRegion(MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2.5, longitudinalMeters: 2.5), animated: true)
    }
    
    @objc func chooseMapVersion(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break
        }
    }
    
    
}
