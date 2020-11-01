import UIKit
import RealmSwift

class CreateViewController: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var importanceControl: UISegmentedControl!
    
    var importance = "低"
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func importanceChanged(_ sender: Any) {
        let selectedIndex = importanceControl.selectedSegmentIndex
        importance = importanceControl.titleForSegment(at: selectedIndex)!
    }
    
    
    @IBAction func touchCreateButton(_ sender: Any) {
        if todoTextField.text!.isEmpty{
            alertController = UIAlertController(title: nil, message: "Todoを入力してください", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }else{
            let realm = try! Realm()
            let todo: TodoModel = TodoModel()
            todo.memo = self.todoTextField.text
            todo.importance = importance
            try! realm.write {
               realm.add(todo)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

