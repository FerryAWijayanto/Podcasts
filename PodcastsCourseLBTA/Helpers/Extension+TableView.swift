//
//  Extension+TableView.swift
//  PodcastsCourseLBTA
//
//  Created by Ferry Adi Wijayanto on 17/08/19.
//  Copyright © 2019 Ferry Adi Wijayanto. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReausableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UITableViewCell>(_: T.Type) where T: ReausableView, T: NibLoadedView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReausableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {  fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
        
        return cell
    }
}
