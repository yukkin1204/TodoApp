import UIKit
import RealmSwift

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{    
  
    @IBOutlet weak var todoTable: UITableView!
    var todoList: Results<TodoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        self.todoList = realm.objects(TodoModel.self).sorted(byKeyPath: "date", ascending: true)
        
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = "一覧"
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.todoTable.reloadData()
    }
    
    @IBAction func touchPlusButton(_ sender: Any) {
        let storyboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "CreateView")
        self.navigationController?.pushViewController(nextView, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        nextView.id = todoList[indexPath.row].id
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}

