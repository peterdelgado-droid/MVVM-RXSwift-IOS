//
//  EntriesViewModel.swift
//  RX
//
//  Created by Peter Delgado on 6/7/22.
//

import Foundation

struct EntriesViewModel{

	private let entity : Entries

	init(entity: Entries){
		self.entity = entity

	}


	



	var displayText: String{
		//entries!.first!.aPI
		

		return  entity.aPI + " - " + entity.link

	}




}
