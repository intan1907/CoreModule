//
//  GetListPresenter.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import RxSwift

public class GetListPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {
    
    private var disposeBag = DisposeBag()
    
    private let _useCase: Interactor
    
    public var list = PublishSubject<[Response]>()
    public var errorMessage = PublishSubject<String>()
    public var isLoading = PublishSubject<Bool>()
    public var isError = PublishSubject<Bool>()
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getList(request: Request?) {
        isLoading.onNext(true)
        _useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { list in
                self.list.onNext(list)
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
