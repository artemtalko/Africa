//
//  MapView.swift
//  Africa
//
//  Created by Artem Talko on 23.07.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	@State private var region: MKCoordinateRegion = {
		var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4)
		var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
		var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
		
		return mapRegion
	}()
	
	let location: [NationalParkLocation] = Bundle.main.decode("locations.json")
	
	var body: some View {
		
		//MARK: 1 BASIC MAP
		//Map(coordinateRegion: $region)
		
		//MARK: 2 ADVANCED MAP
		Map(coordinateRegion: $region, annotationItems: location, annotationContent: { item in
			//MapMarker(coordinate: item.location, tint: .accentColor)
			
			MapAnnotation(coordinate: item.location) {
			MapAnnotationView(location: item)
			}
		})//Anotation
		.overlay(
			HStack(alignment: .center, spacing: 12) {
				Image("compass")
				.resizable()
				.scaledToFit()
				.frame(width: 48, height: 48, alignment: .center)
				
				VStack(alignment: .leading, spacing: 3) {
					HStack {
						Text("Latitude:")
							.font(.footnote)
							.fontWeight(.bold)
							.foregroundColor(.accentColor)
						Spacer()
						Text("\(region.center.latitude)")
							.font(.footnote)
							.fontWeight(.bold)
							
					}
					HStack {
						Text("Longitude:")
							.font(.footnote)
							.fontWeight(.bold)
							.foregroundColor(.accentColor)
						Spacer()
						Text("\(region.center.longitude)")
							.font(.footnote)
							.fontWeight(.bold)
							
					}
					
					Divider()
					
				}
			}//: HSTACK
				.padding(.vertical, 12)
				.padding(.horizontal, 16)
				.background(
					Color.black
						.cornerRadius(8)
						.opacity(0.6)
				)
				.padding()
				, alignment: .top
		)
	}
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
