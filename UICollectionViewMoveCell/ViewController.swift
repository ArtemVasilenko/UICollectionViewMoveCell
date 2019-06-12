import UIKit

class ViewController: UIViewController {
    
     var fruits = [Fruit(name: "Apple", icon: UIImage(named: "apple")!),
                          Fruit(name: "Banana", icon: UIImage(named: "banana")!),
                          Fruit(name: "Garnet", icon: UIImage(named: "garnet")!),
                          Fruit(name: "Grapes", icon: UIImage(named: "grapes")!),
                          Fruit(name: "Green Apple", icon: UIImage(named: "green_apple")!),
                          Fruit(name: "Green Pears", icon: UIImage(named: "green_pears")!),
                          Fruit(name: "Kiwi", icon: UIImage(named: "kiwi")!),
                          Fruit(name: "Mango", icon: UIImage(named: "mango")!),
                          Fruit(name: "Mango 2", icon: UIImage(named: "mango2")!),
                          Fruit(name: "Orange", icon: UIImage(named: "orange")!),
                          Fruit(name: "Pears", icon: UIImage(named: "pears")!),
                          Fruit(name: "Pineapple", icon: UIImage(named: "pineapple")!)
    ]
    
    private var longPressGesture: UILongPressGestureRecognizer!
    private let sectionInSets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20) //закругление
    private let itemsPerlow: CGFloat = 3
    
    let collection = UICollectionView()

    
    @objc func hundlerLongGesture (gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began: guard let selectedIndexPath = collection.indexPathForItem(at: gesture.location(in: collection)) else { break }
        collection.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collection.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collection.endInteractiveMovement()
        default:
            collection.cancelInteractiveMovement()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector (hundlerLongGesture(gesture:)))
        collection.addGestureRecognizer(longPressGesture)
        
        collection.delegate = self
        collection.dataSource = self
        collection.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.view.addSubview(collection)
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let image = fruits[indexPath.row].icon
        let imageView = UIImageView(frame: cell.contentView.frame)
        
        return cell
    }
    
    
}

