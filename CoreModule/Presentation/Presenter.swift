//
//  Presenter.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import RxSwift

public class Presenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private var disposeBag = DisposeBag()
    
    private let _useCase: Interactor
    
    public var item = PublishSubject<Response>()
    public var errorMessage = PublishSubject<String>()
    public var isLoading = PublishSubject<Bool>()
    public var isError = PublishSubject<Bool>()
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func execute(request: Request?) {
        isLoading.onNext(true)
        _useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { item in
                self.item.onNext(item)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
                self.isError.onNext(true)
                self.isLoading.onNext(false)
            } onCompleted: {
                self.isError.onNext(false)
                self.isLoading.onNext(false)
            }.disposed(by: disposeBag)
    }
    
}
