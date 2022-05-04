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
    
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getList(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { list in
                self.list = list
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.isLoading = false
            } onCompleted: {
                self.isError = false
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
}
