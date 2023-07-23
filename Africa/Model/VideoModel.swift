//
//  VideoModel.swift
//  Africa
//
//  Created by Artem Talko on 25.07.2023.
//

import Foundation

struct Video: Codable, Identifiable {
	let id: String
	let name: String
	let headline: String
	
	//computed prop
	var thumbnail: String {
		"video-\(id)"
	}
}
