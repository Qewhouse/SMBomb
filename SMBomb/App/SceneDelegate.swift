//
//  SceneDelegate.swift
//  SMBomb
//
//  Created by Alexander Altman on 06.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        let viewController = StartScreenviewController()// изначальная настройка viewController
        let viewController = GameViewController()
        /* Для того, чтобы автоматически отображать Ваш экран при запуске симулятора нужно:
            1. Скопировать строку №17 на строку №18
            2. В строке №18 поменять MainViewController на название Вашего ViewController
            3. При завершении работы и перед Pull Request'ом удалить вашу строку №18 и раскоментировать строку №17
         
         - Для чего?
         - Для того, чтобы избавиться от не нужных конфликтов при merge, ибо все дополнительные строки будут давать возможные конфликты
         */
        
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
