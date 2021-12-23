//
//  MainTabBarCoordinator.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 21.12.2021.
//

import Combine
import SwiftUI

class MainTabBarCoordinator {
    
    let navigationController: UINavigationController
    private let loginViewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    @AppStorage("vkToken") var token: String?
    
    init(navigationController: UINavigationController) {
        let loginView = LoginView(viewModel: loginViewModel)
        let loginViewController = UIHostingController(rootView: loginView)
        self.navigationController = UINavigationController(rootViewController: loginViewController)

    }
    
    public func start() {
        loginViewModel.$isUserLoggedIn.subscribe(on: RunLoop.main).sink { [weak self] isLogin in
            guard let self = self else { return }
            if self.token == nil  {
                self.navigationController.popToRootViewController(animated: true)
                let authView = VKLoginWebView()
                let authViewController = UIHostingController(rootView: authView)
                self.navigationController.pushViewController(authViewController, animated: true)
            } else {
                let mainTabBarViewController = self.createMainTabBarViewController()
                self.navigationController.pushViewController(mainTabBarViewController, animated: true)
            }
        }.store(in: &cancellables)
    }
    
    private func createMainTabBarViewController() -> UITabBarController {
        let friendsVC = createFriendsViewController()
        friendsVC.tabBarItem.image = UIImage(systemName: "person.3.fill")
        friendsVC.tabBarItem.title = "Друзья"
        let firstVC = configuredNavigationController(rootViewController: friendsVC)
        
        let groupsVC = createGroupsViewController()
        groupsVC.tabBarItem.image = UIImage(systemName: "person.2.crop.square.stack.fill")
        groupsVC.tabBarItem.title = "Группы"
        let secondVC = configuredNavigationController(rootViewController: groupsVC)
        
        let newsVC = createNewsViewController()
        newsVC.tabBarItem.image = UIImage(systemName: "newspaper")
        newsVC.tabBarItem.title = "Новости"
        let thirdVC = configuredNavigationController(rootViewController: newsVC)

        let tabBarGroup = self.configuredTabBarController
        tabBarGroup.viewControllers = [firstVC, secondVC, thirdVC]
        
        return tabBarGroup
    }
    
    private func createFriendsViewController() -> UIViewController {
        let friendsVC = UserPreviewView(viewModel: UserViewModel(apiService: APIRequest(), realmStorage: UsersDatabaseService()), loginModel: loginViewModel)
        return UIHostingController(rootView: friendsVC)
    }
    
    private func createGroupsViewController() -> UIViewController {
        let groupsVC = GroupPreviewView(viewModel: GroupViewModel(apiService: APIRequest(), realmStorage: GroupsDatabaseService()))
        return UIHostingController(rootView: groupsVC)
    }
    
    private func createNewsViewController() -> UIViewController {
        let newsVC = NewsPreviewView(viewModel: NewsViewModel(apiService: APIRequest(), realmStorage: NewsDatabaseService(), realmNewsGroups: NewsGroupsDatabaseService()))
        return UIHostingController(rootView: newsVC)
    }
                                   
    private func configuredNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootViewController)
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }

    private lazy var configuredTabBarController: UITabBarController = {
        let tabBarGroup = UITabBarController()
        tabBarGroup.tabBar.isTranslucent = true
        return tabBarGroup
    }()
}
