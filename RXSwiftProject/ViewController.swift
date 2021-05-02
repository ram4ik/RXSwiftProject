//
//  ViewController.swift
//  RXSwiftProject
//
//  Created by ramil on 02.05.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Publish Subject:
        _ = PublishSubject<String>()
        
        // Behaviour Subject:
        _ = BehaviorSubject(value: "initial value")
        
        // Replay Subject:
        _ = ReplaySubject<String>.create(bufferSize: 3)
        
        // Behaviour Relay:
        _ = BehaviorRelay<Bool>(value: true)
        
        
        // Creating Observables:
        let observable1 = Observable.just(1)
        observable1.subscribe({print($0)}).dispose()
        
        let observable2 = Observable.of(10, 20, 30)
        observable2.subscribe({print($0)}).dispose()
        
        let observable3 = Observable.from([1, 2, 3, 4, 5])
        observable3.subscribe({print($0)}).dispose()
        
        
        // Dispose and Dispose Bag
        let subsribe1 = Observable.from([100, 200, 300]).subscribe({
            print($0)
        })
        subsribe1.dispose()
        
        let disposeBag = DisposeBag()
        _ = Observable.from([1, 2, 3]).subscribe({print($0)}).disposed(by: disposeBag)
        
        
        // Subscribing to Next events only:
        _ = Observable.from([11, 12, 13]).subscribe(onNext: {print($0)})
        
        
        // Subscribing to all events:
        _ = Observable.from([11, 12, 13]).subscribe(onNext: {print($0)},
                                                    onError: {print("Error is \($0)")},
                                                    onCompleted: {print("observable sequence Completed")},
                                                    onDisposed: {print("observable sequesnce Disposed")})
    }


}

