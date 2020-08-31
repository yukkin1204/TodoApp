import UIKit
import RealmSwift

class DetailViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let todo: TodoModel! = realm.object(ofType: TodoModel.self, forPrimaryKey: id)
        todoLabel.text = todo.memo
    }
    
    @IBAction func touchDeleteButton(_ sender: Any) {
        let realm = try! Realm()
        let todo: TodoModel! = realm.object(ofType: TodoModel.self, forPrimaryKey: id)
        try! realm.write {
            realm.delete(todo)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
