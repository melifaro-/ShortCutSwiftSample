import Cocoa
import AppKit

class ViewController: NSViewController {

    var kShortCut: MASShortcut!
    
    @IBOutlet weak var shortcutView: MASShortcutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        shortcutView.shortcutValueChange = { (sender) in
            
            let callback: (() -> Void)!
            
            if self.shortcutView.shortcutValue.keyCodeStringForKeyEquivalent == "k" {
                
                self.kShortCut = self.shortcutView.shortcutValue
                
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
    
    @IBAction func unregisterAllButtonClicked(sender: AnyObject) {
        
        MASShortcutMonitor.sharedMonitor().unregisterAllShortcuts()
    }
    
    @IBAction func unregisterKShortCutButtonClicked(sender: AnyObject) {
        
        unregisterKShortCutIfNeeded()
    }
    
    func unregisterKShortCutIfNeeded() {
        
        guard let shortcut = kShortCut else {
            
            return
        }
        MASShortcutMonitor.sharedMonitor().unregisterShortcut(shortcut)
    }
}
