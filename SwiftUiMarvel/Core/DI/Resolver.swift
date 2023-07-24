//
//  Resolver.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping

/// Resolver is a singleton class that is responsible for injecting all dependencies in the app.
class Resolver {

    /// The shared instance of the resolver.
    static let shared = Resolver()

    /// The container that holds all the dependencies.
    private var container = Container()

    /// This method is responsible for injecting all dependencies in the app.
    ///
    /// > It should be called only once in the app's lifecycle.
    @MainActor func injectModules() {
        injectUtils()
        injectDataSources()
        injectRepositories()
        injectUseCases()
        injectViewModels()
    }

   
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

// MARK: - Injecting Utils -

extension Resolver {
    private func injectUtils() {
        container.register(NetworkManager.self) { _ in
            DefaultNetworkManager()
        }.inObjectScope(.container)
        container.register(RequestManager.self) { resolver in
            DefaultRequestManager(networkManager: resolver.resolve(NetworkManager.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting DataSources -

extension Resolver {
    private func injectDataSources() {
        container.register(CharactersDataSource.self) { resolver in
            DefaultCharactersDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
        container.register(ComicsDataSource.self) { resolver in
            DefaultComicsDataSource(requestManager: resolver.resolve(RequestManager.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting Repositories -

extension Resolver {
    
    private func injectRepositories() {
        container.register(CharactersRepository.self) { resolver in
            DefaultCharactersRepository(charactersDataSource: resolver.resolve(CharactersDataSource.self)!)
        }.inObjectScope(.container)
        container.register(ComicsRepository.self) { resolver in
            DefaultComicsRepository(comicsDataSource: resolver.resolve(ComicsDataSource.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting Use Cases -

extension Resolver {
    
    private func injectUseCases() {
        container.register(GetCharactersUC.self) { resolver in
            DefaultGetCharactersUC(repository: resolver.resolve(CharactersRepository.self)!)
        }.inObjectScope(.container)
        container.register(GetComicsUC.self) { resolver in
            DefaultGetComicsUC(repository: resolver.resolve(ComicsRepository.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Injecting ViewModels -

extension Resolver {
    
    @MainActor
    private func injectViewModels() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(getCharactersUseCase: resolver.resolve(GetCharactersUC.self)!)
        }
        container.register(CharacterProfileViewModel.self) { resolver in
            CharacterProfileViewModel(getComicsUC: resolver.resolve(GetComicsUC.self)!)
        }
    }
}
