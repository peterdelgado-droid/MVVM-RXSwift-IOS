//
//  ViewController.swift
//  RX
//
//  Created by Peter Delgado on 30/6/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

	@IBOutlet weak var tableview: UITableView!

	let disposebag = DisposeBag()
	private var viewModel : EntriesListViewModel!

	static func instantiate(viewModel: EntriesListViewModel) -> ViewController{
		let storyboard = UIStoryboard(name: "Main", bundle: .main)
		let viewController = storyboard.instantiateInitialViewController() as!
		ViewController
		viewController.viewModel = viewModel
		return viewController



	}

	override func viewDidLoad() {
		super.viewDidLoad()


		navigationItem.title = viewModel.title
		navigationController?.navigationBar.prefersLargeTitles = true


		 viewModel.fectchEntriesViewModel().observe(on: MainScheduler.instance)   .bind(to:tableview.rx.items(cellIdentifier: "cell"))  { index, viewModel, cell in
			cell.textLabel?.text = viewModel.displayText

		}.disposed(by: disposebag)


		//viewModel.o


	}


}

