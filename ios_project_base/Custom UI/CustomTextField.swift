//
//  CustomTextField.swift
//  ios_project_base
//
//  Created by Abdmin on 04/10/2021.
//

import UIKit

enum ResponderStandardEditActions {
    case cut, copy, paste, select, selectAll, delete
    case makeTextWritingDirectionLeftToRight, makeTextWritingDirectionRightToLeft
    case toggleBoldface, toggleItalics, toggleUnderline
    case increaseSize, decreaseSize

    var selector: Selector {
        switch self {
            case .cut:
                return #selector(UIResponderStandardEditActions.cut)
            case .copy:
                return #selector(UIResponderStandardEditActions.copy)
            case .paste:
                return #selector(UIResponderStandardEditActions.paste)
            case .select:
                return #selector(UIResponderStandardEditActions.select)
            case .selectAll:
                return #selector(UIResponderStandardEditActions.selectAll)
            case .delete:
                return #selector(UIResponderStandardEditActions.delete)
            case .makeTextWritingDirectionLeftToRight:
                return #selector(UIResponderStandardEditActions.makeTextWritingDirectionLeftToRight)
            case .makeTextWritingDirectionRightToLeft:
                return #selector(UIResponderStandardEditActions.makeTextWritingDirectionRightToLeft)
            case .toggleBoldface:
                return #selector(UIResponderStandardEditActions.toggleBoldface)
            case .toggleItalics:
                return #selector(UIResponderStandardEditActions.toggleItalics)
            case .toggleUnderline:
                return #selector(UIResponderStandardEditActions.toggleUnderline)
            case .increaseSize:
                return #selector(UIResponderStandardEditActions.increaseSize)
            case .decreaseSize:
                return #selector(UIResponderStandardEditActions.decreaseSize)
        }
    }
}

class CustomTextField: UITextField {
    
    public var backspaceCalled: (()->())?
    private var isHideCursor: Bool = false
    private var editActions: [ResponderStandardEditActions: Bool]?
    private var filterEditActions: [ResponderStandardEditActions: Bool]?
    
    override func deleteBackward() {
      super.deleteBackward()
      backspaceCalled?()
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        if isHideCursor {
            return .zero
        }
        else {
            return super.caretRect(for: position)
        }
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        if isHideCursor {
            return []
        }
        else {
            return super.selectionRects(for: range)
        }
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if isHideCursor {
            if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) {
                return false
            }
        }
        
        if let actions = editActions {
            for _action in actions where _action.key.selector == action { return _action.value }
            return false
        }
        
        if let actions = filterEditActions {
            for _action in actions where _action.key.selector == action { return _action.value }
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
    
    func setIsHideCursor(isHide: Bool) {
        isHideCursor = isHide
    }
    
    func setEditActions(only actions: [ResponderStandardEditActions]) {
        if self.editActions == nil { self.editActions = [:] }
        filterEditActions = nil
        actions.forEach { self.editActions?[$0] = true }
    }
    
    func addToCurrentEditActions(actions: [ResponderStandardEditActions]) {
        if self.filterEditActions == nil { self.filterEditActions = [:] }
        editActions = nil
        actions.forEach { self.filterEditActions?[$0] = true }
    }
    
    private func filterEditActions(actions: [ResponderStandardEditActions], allowed: Bool) {
        if self.filterEditActions == nil { self.filterEditActions = [:] }
        editActions = nil
        actions.forEach { self.filterEditActions?[$0] = allowed }
    }
    
    func filterEditActions(notAllowed: [ResponderStandardEditActions]) {
        filterEditActions(actions: notAllowed, allowed: false)
    }
    
    func resetEditActions() { editActions = nil }
}
