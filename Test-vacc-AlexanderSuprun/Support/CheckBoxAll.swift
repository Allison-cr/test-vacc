//
//  CheckBoxAll.swift
//  Test-vacc-AlexanderSuprun
//
//  Created by Alexander Suprun on 18.08.2024.
//

import RxSwift
import UIKit
import RxRelay

// MARK: - CheckboxAllButton

class CheckboxAllButton: UIButton {
    
    // MARK: - Properties
    
    var isChecked: Bool = false

    // MARK: - Initializers
       
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
       
    /// Sets up the button's appearance and action handler.
    private func setupButton() {
        self.setTitle("Выбрать все", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setImage(UIImage(systemName: "square"), for: .normal)
        self.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        self.tintColor = .black
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: Margins.spacing, bottom: 0, right: -Margins.spacing)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Action Methods
    
    /// Handles the button tap, toggling its selection state.
    @objc private func buttonTapped() {
        self.isChecked.toggle()
        self.isSelected = self.isChecked
    }
}

// MARK: - Reactive Extensions

/// Reactive extension for integrating with RxSwift, enabling reactive binding for the `isChecked` state.
extension Reactive where Base: CheckboxAllButton {
    var isChecked: Binder<Bool> {
        return Binder(self.base) { button, isChecked in
            button.isChecked = isChecked
            button.isSelected = isChecked
        }
    }
}
