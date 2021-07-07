//
//  Extension+RegisterTableView.swift
//  PodcastsCourseLBTA
//
//  Created by Ferry Adi Wijayanto on 17/08/19.
//  Copyright © 2019 Ferry Adi Wijayanto. All rights reserved.
//

import UIKit

protocol ReausableView: class {
    static var reuseIdentifier: String { get }
}

extension ReausableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadedView: class {
    static var nibName: String { get }
}

extension NibLoadedView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
