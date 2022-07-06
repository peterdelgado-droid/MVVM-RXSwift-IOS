//
//  ViewController.swift
//  RX
//
//  Created by Peter Delgado on 30/6/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {


	let disposebag = DisposeBag()

	static func instantiate() -> ViewController{
		let storyboard = UIStoryboard(name: "Main", bundle: .main)
		let viewController = storyboard.instantiateInitialViewController() as!
		ViewController
		return viewController



	}

	override func viewDidLoad() {
		super.viewDidLoad()

		let service = Service()

		service.fetchRestaurants().subscribe(onNext: { restaurants in
			print("hello")
			print(restaurants)

		})


	}


}

