import UIKit
import WebKit

class ViewController: UIViewController
{
    @IBOutlet weak var myWeb : WKWebView!
    
    
    //check branches of the project
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myWeb.allowsBackForwardNavigationGestures = true
        
        guard let url = URL(string: "https://www.hackingwithswift.com") else {return}
        
        let request = URLRequest(url: url)
        
        myWeb.load(request)
        
        
    }
}

