import Foundation
import RealmSwift

class TodoModel: Object{
    @objc dynamic var id : String = NSUUID().uuidString
    @objc dynamic var memo: String? = nil
    @objc dynamic var importance: String? = nil
    @objc dynamic var date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
