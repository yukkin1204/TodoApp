import UIKit
import RealmSwift

class DetailViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    
    var id: String?
    var todo: TodoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        todo = realm.object(ofType: TodoModel.self, forPrimaryKey: id)
        todoLabel.text = todo.memo
        
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = "戻る"
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @IBAction func touchEditButton(_ sender: Any) {
        let storyboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "EditView") as! EditViewController
        nextView.id = id
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @IBAction func touchDeleteButton(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todo)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
