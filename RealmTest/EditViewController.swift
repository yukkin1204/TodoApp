import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    @IBOutlet weak var todoTextField: UITextField!
    
    var id: String?
    var todo: TodoModel!
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        todo = realm.object(ofType: TodoModel.self, forPrimaryKey: id)
        todoTextField.text = todo.memo
    }
    
    @IBAction func touchUpdateButton(_ sender: Any) {
        if todoTextField.text!.isEmpty{
            alertController = UIAlertController(title: nil, message: "Todoを入力してください", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }else{
            let realm = try! Realm()
            try! realm.write {
                todo.memo = todoTextField.text
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
