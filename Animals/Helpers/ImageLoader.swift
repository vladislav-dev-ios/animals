import UIKit

class ImageLoader {
    
    static func fetch(url: URL, _ completion : @escaping (_ image: UIImage?) -> Void) {
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                let image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}
