//
//  AppCoordinator.swift
//  RX
//
//  Created by Peter Delgado on 1/7/22.
//

import Foundation
import UIKit

class AppCoordintor{

	private let window: UIWindow

	init(window: UIWindow){
		self.window = window

	}

	func start(){
		let viewController = ViewController.instantiate()
		let navController = UINavigationController(rootViewController: viewController)

		window.rootViewController = navController
		window.makeKeyAndVisible()

	}


}
