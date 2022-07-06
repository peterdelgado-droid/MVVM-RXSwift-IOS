//
//  SceneDelegate.swift
//  RX
//
//  Created by Peter Delgado on 30/6/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var appCoordinator: AppCoordintor?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: scene)
		appCoordinator = AppCoordintor(window: window)
		appCoordinator?.start()

	}




}

