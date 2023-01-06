//
//  LocationView.swift
//  MJ_APP
//
//  Created by admin on 6/1/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct LocationView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State var showingAlert = false
    @State var showCurrentLocatonBtn = true
    
    private var pointsOfInterest = [
        AnnotatedItem(name: "Biu Kee Mahjong", image: "BiuKeeMahjong", coordinate: .init(latitude: 22.30527, longitude: 114.1694921)),
        AnnotatedItem(name: "Golden Sparrow",image: "GoldenSparrow", coordinate: .init(latitude: 22.306863, longitude: 114.185553)),
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            Map(coordinateRegion: $viewModel.region,
                showsUserLocation: true,
                annotationItems: pointsOfInterest){
                item in MapAnnotation(coordinate: item.coordinate) {
                    VStack {
                        MapPinCardView(name: item.name, image: item.image)
                    }
                }
            }
                .ignoresSafeArea()
                .tint(.pink)
            if(showCurrentLocatonBtn){
                LocationButton(.currentLocation){
                    print("Click")
                    viewModel.requestAllowOnceLocationPermission()
                    showingAlert = true
                    
                }
                .foregroundColor(.white)
                .cornerRadius(8)
                .labelStyle(.titleAndIcon)
                .symbolVariant(.fill)
                .tint(.pink)
                .alert("Done", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        showCurrentLocatonBtn = false
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.302711, longitude: 114.177216), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locationManger = CLLocationManager()
    
    override init(){
        super.init()
        locationManger.delegate = self
    }
    
    func requestAllowOnceLocationPermission(){
        locationManger.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    let image : String
    var coordinate: CLLocationCoordinate2D
}
