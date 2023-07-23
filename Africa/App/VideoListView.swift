//
//  VideoListView.swift
//  Africa
//
//  Created by Artem Talko on 23.07.2023.
//

import SwiftUI

struct VideoListView: View {
	@State var videos: [Video] = Bundle.main.decode("videos.json")
	let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
	
	
    var body: some View {
			NavigationView {
				List(videos) { item in
					NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
						VideoListItemView(video: item)
							.padding(.vertical, 8)
					}
				}//: LIST
				.listStyle(InsetGroupedListStyle())
				.navigationBarTitle("Videos")
				.toolbar{
					ToolbarItem(placement: .navigationBarTrailing) {
						Button(action: {
							videos.shuffle()
							hapticImpact.impactOccurred()
						}) {
							Image(systemName: "arrow.2.squarepath")
						}
					}
				}
			}//: NAVIGATION

    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
