// tree structure of doc elements
public enum Node {

    // node types
    indirect case tag(start:String, end:String = "", children:Node? = nil)
    case children(nodes:[Node])
    case content(String)

    // to render the tree structure as string
    func render(into r:inout String) {
        switch self {
        case let .tag(start, end, children):
            r.append(start)
            if children != nil {
                children!.render(into: &r)
            }
            r.append(end)
        case let .children(children):
            r.append(children.reduce(into: "") {
                $1.render(into: &$0)
            })
        case let .content(string):
            r.append(string)
        }
    }

    // convenience method to build node groups
    static func group(_ children:Node...) -> Node {
        return .children(nodes: children)
    }
}
