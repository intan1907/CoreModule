//
//  Presenter.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Combine

public class Presenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let useCase: Interactor
    
    @Published public var item: Response? = nil
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor) {
        self.useCase = useCase
    }
    
    public func execute(request: Request?) {
        self.isLoading = true
        self.useCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                case .finished:
                    self.isLoading = false
                    self.isError = false
                }
                self.isLoading = false
            } receiveValue: { [weak self] response in
                self?.item = response
            }
            .store(in: &cancellables)
    }
    
}
