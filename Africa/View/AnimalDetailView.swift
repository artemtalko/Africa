//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Artem Talko on 24.07.2023.
//

import SwiftUI

struct AnimalDetailView: View {
	let animal: Animal
	
    var body: some View {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .center, spacing: 20) {
					//IMAGE
					Image(animal.image)
						.resizable()
						.scaledToFit()
					
					
					//TITLE
					Text(animal.name.uppercased())
						.font(.largeTitle)
						.fontWeight(.heavy)
						.multilineTextAlignment(.center)
						.padding(.vertical, 8)
						.foregroundColor(.primary)
						.background(
							Color.accentColor
								.frame(height: 6)
								.offset(y: 24)
						)
					
					
					//HEADLINE
					Text(animal.headline)
						.font(.headline)
						.foregroundColor(.accentColor)
						.padding(.horizontal)
					
					
					//GALLERY
					Group {
						HeadlineView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
						InsetGalleryView(animal: animal)
					}
					.padding(.horizontal)
					
					
					//FACTS
					Group {
						HeadlineView(headingImage: "questionmark.circle", headingText: "Did you know?")
						InsetFactView(animal: animal)
					}
					.padding(.horizontal)
					
					
					//DESCRIPTION
					Group {
						HeadlineView(headingImage: "info.circle", headingText: "all about \(animal.name)")
						
						Text(animal.description)
							.multilineTextAlignment(.leading)
							.layoutPriority(1)
					}
					.padding(.horizontal)
					
					//MAP
					Group {
						HeadlineView(headingImage: "map", headingText: "National parks")
						
						InsetMapView()
					}
					.padding(.horizontal)
					
					//LINK
					Group{
						HeadlineView(headingImage: "books.vertical", headingText: "Learn more")
						ExternalWebLinkView(animal: animal)
					}
					
				}//: VSTACK
				.navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
			}//: SCROLL VIEW
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
			NavigationView {
				AnimalDetailView(animal: animals[1])
			}
    }
}
