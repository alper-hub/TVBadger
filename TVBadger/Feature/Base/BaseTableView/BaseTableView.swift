//
//  BaseTableView.swift
//  TVBadger
//
//  Created by Alper Tufan on 5.02.2022.
//

import Foundation
import UIKit

class MyTableView: UITableView {

    var sectionHeaders: [UITableViewHeaderFooterView]
    var tableCells: [UITableViewCell]
    var cellData: [Any]

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }

    init(color: UIColor) {
        
    }
}

extension MyTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
