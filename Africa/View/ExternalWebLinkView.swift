//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Artem Talko on 25.07.2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
	let animal: Animal
	
    var body: some View {
			Group {
				HStack {
					Image(systemName: "globe")
					Text("Wikipedia")
					Spacer()
					
					Group {
						Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
						Image(systemName: "arrow.up.right.square")
					}
					.foregroundColor(.accentColor)
				}//: HSTACK
			}//: GROUP BOX
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
    static var previews: some View {
			ExternalWebLinkView(animal: animals[0])
				.padding()
    }
}
