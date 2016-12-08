//
//  CustomCell.swift
//  ModalDialogExample
//
//  Created by William McCoy on 12/7/16.
//  Copyright © 2016 William McCoy. All rights reserved.
//

import Foundation
import Eureka

public class CustomCell: Cell<Bool>, CellType {
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    public override func setup() {
        super.setup()
        
    }
    
    
    public override func update() {
        super.update()
        backgroundColor = (row.value ?? false) ? .white : .black
    }
}

// The custom Row also has the cell: CustomCell and its correspond value
public final class CustomRow: Row<CustomCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<CustomCell>(nibName: "CustomCell")
    }
}
