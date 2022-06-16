import Foundation

protocol NetworkServiceProtocol {
    func getAnimals(completion: @escaping (Result<[Animal]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    let baseUrlString = "https://zoo-animal-api.herokuapp.com/animals/rand/6"
    
    func getAnimals(completion: @escaping (Result<[Animal]?, Error>) -> Void) {
        
        guard let url = URL(string: baseUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Animal].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
