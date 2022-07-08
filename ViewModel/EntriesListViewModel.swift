//
//  EntriesListViewModel.swift
//  RX
//
//  Created by Peter Delgado on 6/7/22.
//

import Foundation
import RxSwift




final class EntriesListViewModel: SearchViewModel<EntriesViewModel>{

	let title = "Entries"


	private let serviceProto: ServiceProtocol 

	init(serviceProto: ServiceProtocol = Service()){
		self.serviceProto = serviceProto

	}

	override func search(byTerm term: String) -> Observable<[EntriesViewModel]> {

		
		let dogs = fectchEntriesViewModel()

		let filteredDogs = dogs.filter { $0.first!.displayText == term.lowercased()}


		return Observable.create({ (observer) -> Disposable in
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {


				observer.onNext(filteredDogs)
			}

			return Disposables.create()
		})
	}


	func fectchEntriesViewModel() -> Observable<[EntriesViewModel]>{

    serviceProto.fetchRestaurants().map { $0.entries!.map {

	 EntriesViewModel(entity: $0)


		}

		}

	}




}


