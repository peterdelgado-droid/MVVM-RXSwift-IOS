//
//  SearchViewController.swift
//  RX
//
//  Created by Peter Delgado on 7/7/22.
//

import Foundation
import UIKit
import RxSwift
import Cartography
class SearchViewController<T>: UIViewController {

	let searchBar = UISearchBar()
	let viewModel: SearchViewModel<T>
	private let bag = DisposeBag()

	var errorView: UIView? {
		return nil
	}

	var loadingView: UIView? {
		return nil
	}

	var contentView: UIView {
		fatalError("ContentView needs to be overriden")
	}

	init(viewModel: SearchViewModel<T>) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureSearchBar()

		// initial state
		errorView?.isHidden = true
		loadingView?.isHidden = true
	}

	private func configureSearchBar() {
		searchBar.barStyle = .default
		view.addSubview(searchBar)
		constrain(view, searchBar) { (superView, view) in
			view.top ==  superView.top
			view.leading == superView.leading
			view.trailing == superView.trailing
		}
	}

	private func bindViews() {
		searchBar
			.rx
			.text
			.orEmpty
			.bind(to: self.viewModel.searchObserver)
			.disposed(by: bag)

		viewModel.isLoading.asDriver().drive(contentView.rx.isHidden).disposed(by: bag)
		viewModel.error
			.map { $0 != nil }
			.drive(contentView.rx.isHidden)
			.disposed(by: bag)

		if let loadingView = loadingView {
			viewModel.isLoading
				.map(!)
				.drive(loadingView.rx.isHidden)
				.disposed(by: bag)
			viewModel.error
				.map { $0 != nil }
				.drive(loadingView.rx.isHidden)
				.disposed(by: bag)
		}

		if let errorView = errorView {
			viewModel.error
				.map { $0 == nil }
				.drive(errorView.rx.isHidden)
				.disposed(by: bag)

		}
	}



}
