//
//  HeadlineView.swift
//  Africa
//
//  Created by Artem Talko on 24.07.2023.
//

import SwiftUI

struct HeadlineView: View {
	
	var headingImage: String
	var headingText: String
	
    var body: some View {
			HStack {
				Image(systemName: headingImage)
					.foregroundColor(.accentColor)
					.imageScale(.large)
				
				Text(headingText)
					.font(.title3)
					.foregroundColor(.accentColor)
				
			}
			.padding(.vertical)
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
			HeadlineView(headingImage: "gamecontroller.fill", headingText: "game")
    }
}
