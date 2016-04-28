import Cocoa
import AppKit

class ViewController: NSViewController {

    @IBOutlet weak var shortcutView: MASShortcutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortcutView.shortcutValueChange = { (sender) in
            
            let callback: (() -> Void)!
            
            if self.shortcutView.shortcutValue.keyCodeStringForKeyEquivalent == "k" {
                callback = {
                    print("K shortcut handler")
                }
            } else {
                callback = {
                    print("Default handler")
                }
            }
            
            MASShortcutMonitor.sharedMonitor().registerShortcut(self.shortcutView.shortcutValue, withAction: callback)
        }

    }
}
