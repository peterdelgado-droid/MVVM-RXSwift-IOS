//
//  Service.swift
//  RX
//
//  Created by Peter Delgado on 6/7/22.
//

import Foundation
import RxSwift

class Service{


	func fetchRestaurants() -> Observable<Json4Swift_Base>{



		return Observable.create { observer -> Disposable in

			let task = URLSession.shared.dataTask(with: URL(string: "https://api.publicapis.org/entries")!)  {

				data, _, _ in


				guard let data = data else{
					observer.onError(NSError(domain: "", code: -1))
					return

				}

				do {
					
					let restaurants = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
					observer.onNext(restaurants)


				} catch {

					observer.onError(error)


				}
				}
			task.resume()

			return Disposables.create{
				task.cancel()

			}


		}





	}
}
