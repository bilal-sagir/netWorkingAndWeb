import UIKit

class ViewController: UIViewController
{
    
    //check branches of the project
    
    override func viewDidLoad()
    {
        json()
        //super.viewDidLoad()
        
    }
}

struct Property : Codable{
    var price: Int
    var id: String
    var type: String
    var img_src: String
    
}

func json(){
    
    let JsonString = """
{"price":450000,"id":"424905","type":"buy","img_src":"http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000MR0044631300503690E01_DXXX.jpg"}
"""
    if let jsondata = JsonString.data(using: .utf8){
        let decoder = JSONDecoder()
        let prop = try! decoder.decode(Property.self, from: jsondata)
        print(prop.price)
    }
}
