//
//  EntriesListViewModel.swift
//  RX
//
//  Created by Peter Delgado on 6/7/22.
//

import Foundation
import RxSwift




final class EntriesListViewModel{

	let title = "Entries"


	private let serviceProto: ServiceProtocol 

	init(serviceProto: ServiceProtocol = Service()){
		self.serviceProto = serviceProto

	}




	func fectchEntriesViewModel() -> Observable<[EntriesViewModel]>{

		serviceProto.fetchRestaurants().map { $0.entries!.map {
			EntriesViewModel(entity: $0)


		}

		}

	}




}


