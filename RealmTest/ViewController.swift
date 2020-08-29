import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoTable: UITableView!

    var todoList: Results<TodoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        self.todoList = realm.objects(TodoModel.self)
    }

    @IBAction func touchAddButton(_ sender: Any) {
        let todo: TodoModel = TodoModel()
        todo.memo = self.todoTextField.text
    
        let realm = try! Realm()
        try! realm.write {
            realm.add(todo)
        }
        self.todoTable.reloadData()
    }
    
    @IBAction func touchResetButton(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        self.todoTable.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TodoCell
        let todo: TodoModel = self.todoList[(indexPath as NSIndexPath).row]
        cell.todoLabel.text = todo.memo
        return cell
    }
}
