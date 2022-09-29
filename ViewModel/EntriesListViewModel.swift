//
//  EntriesListViewModel.swift
//  RX
//
//  Created by Peter Delgado on 6/7/22.
//

import Foundation
import RxSwift




final class EntriesListViewModel: SearchViewModel<EntriesViewModel>{

	private let bag = DisposeBag()

	let title = "Entries"


	private var serviceProto: ServiceProtocol

	init(serviceProto: ServiceProtocol = Service()){
				self.serviceProto = serviceProto


	}



	private func filterCitesByQuery(query: String) {
		// bag probably needs to be reset here
		var biggie = [Entries]()
		serviceProto.fetchRestaurants()
			.map { // map: apply a transformation to $0
				// The desired transformation of $0 is to remove cite that do not contain query
				biggie = $0.entries!.filter { $0.aPI == query.lowercased() }


			}
			.asObservable()
			



	}

	override func search(byTerm term: String) -> Observable<[EntriesViewModel]> {


	//	serviceProto.fetchRestaurants().
		
//		let dogs = fectchEntriesViewModel()
//
//		let filteredDogs = dogs.filter { $0.first!.displayText == term.lowercased()}


		return Observable.create({ (observer) -> Disposable in
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {


		//	observer.onNext(dogs)
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


