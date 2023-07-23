//
//  InsetMapView.swift
//  Africa
//
//  Created by Artem Talko on 25.07.2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
	@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
	
    var body: some View {
			Map(coordinateRegion: $region)
				.overlay(content: {
					NavigationLink(destination: MapView()) {
						HStack {
							Image(systemName: "mappin.circle")
								.foregroundColor(.white)
								.imageScale(.large)
							
							Text("Location")
								.foregroundColor(.accentColor)
								.fontWeight(.bold)
						}//: STACK
						.padding(.vertical, 10)
						.padding(.horizontal, 14)
						.background(.black)
						.opacity(0.6)
						.cornerRadius(10)
					}//: NAVIGATION
					.padding(12)
					
				})
				.frame(height: 256)
				.cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
				.padding()
    }
}
