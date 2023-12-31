//
//  GalleryView.swift
//  Africa
//
//  Created by Artem Talko on 23.07.2023.
//

import SwiftUI

struct GalleryView: View {

	let animals: [Animal] = Bundle.main.decode("animals.json")
	
	@State private var selectedAnimal: String = "lion"
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn: Double = 3.0
	
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
	}
	
    var body: some View {
			ScrollView(.vertical, showsIndicators: false) {
				//MARK: GRID
				VStack(alignment: .center, spacing: 30) {
					//MARK: - IMAGE
					Image(selectedAnimal)
						.resizable()
						.scaledToFit()
						.clipShape(Circle())
						.overlay(Circle().stroke(Color.white, lineWidth: 8))
					
					//MARK: - SLIDER
					Slider(value: $gridColumn, in: 2...4, step: 1)
						.padding(.horizontal)
						.onChange(of: gridColumn) { newValue in
							gridSwitch()
						}

					
					LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
						ForEach(animals) { item in
							Image(item.image)
								.resizable()
								.scaledToFit()
								.clipShape(Circle())
								.overlay(Circle().stroke(Color.white, lineWidth: 1))
								.onTapGesture {
									selectedAnimal = item.image
								}
						}//LOOP
					}//GRID
					.animation(.easeIn(duration: 0.3))
					.onAppear(perform: {
						gridSwitch()
					})
				}//VSTACK
				.padding(.horizontal, 10)
				.padding(.vertical, 50)
			}//SCROLL
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(MotionAnimationView())
			
			
			
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
