// tree structure of doc elements
public enum View {

    // views can be :
    indirect case element(start:String, end:String = "", children:View? = nil)
    case children(views:[View])
    case content(String)

    // to render the tree structure into a string
    public func into(_ r:inout String) {
        switch self {
        case let .element(start, end, children):
            r.append(start)
            if children != nil {
                children!.into(&r)
            }
            r.append(end)
        case let .children(children):
            r.append(children.reduce(into: "") {
                $1.into(&$0)
            })
        case let .content(string):
            r.append(string)
        }
    }

    // convenience method to build groups
    public static func group(_ children:View...) -> View {
        return .children(views: children)
    }
}
