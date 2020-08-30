import UIKit
import RealmSwift

class CreateViewController: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新規作成"
    }
    
    @IBAction func touchCreateButton(_ sender: Any) {
        if todoTextField.text!.isEmpty{
            alertController = UIAlertController(title: nil, message: "Todoを入力してください", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }else{
            let todo: TodoModel = TodoModel()
            todo.memo = self.todoTextField.text
            let realm = try! Realm()
            try! realm.write {
               realm.add(todo)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

