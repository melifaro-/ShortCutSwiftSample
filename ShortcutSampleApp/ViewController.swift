import Cocoa
import AppKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let shortcut = MASShortcut.init(keyCode: UInt(kVK_ANSI_K), modifierFlags: UInt(NSEventModifierFlags.CommandKeyMask.rawValue + NSEventModifierFlags.ShiftKeyMask.rawValue))
        
        MASShortcutMonitor.sharedMonitor().registerShortcut(shortcut, withAction: {
            print("Hello world")
        })
    }
}
