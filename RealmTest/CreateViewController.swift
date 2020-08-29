import UIKit
import RealmSwift

class CreateViewController: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新規作成"
    }
    
    @IBAction func touchCreateButton(_ sender: Any) {
        let todo: TodoModel = TodoModel()
        todo.memo = self.todoTextField.text
        let realm = try! Realm()
        try! realm.write {
           realm.add(todo)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

