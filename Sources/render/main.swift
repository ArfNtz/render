

// tree structure of doc elements with start & end strings
public enum Node {
    indirect case tag(start:String, end:String, children:Node)
    case children(nodes:[Node])
    case content(String)
}

// render a doc, a node
public func render(_ node:Node, into r:inout String) {
    switch node {
    case let .tag(start, end, children):
        r.append(start)
        render(children, into: &r)
        r.append(end)
    case let .children(children):
        r.append(children.reduce(into: "") {
            render($1, into: &$0)
        })
    case let .content(string):
        r.append(string)
    }
}

// generic html tag
extension Node {
    private static func tag(name:String, style_class:String, _ children:Node...) -> Node {
        return tag(start: "<\(name) class='\(style_class)'>", end: "</\(name)>", children: .children(nodes: children))
    }
}

// specific tags
extension Node {
    public static func page(_ children:Node...) -> Node {
        return tag(start: "<html><body>", end: "</body></html>", children: .children(nodes: children))
    }
    // texts
    public static func t1(_ text:String) -> Node {
        return tag(name:"span", style_class:"t1", .content(text))
    }
    public static func t2(_ text:String) -> Node {
        return tag(name:"span", style_class:"t2", .content(text))
    }
    public static func t3(_ text:String) -> Node {
        return tag(name:"span", style_class:"t3", .content(text))
    }
    public static func t4(_ text:String) -> Node {
        return tag(name:"span", style_class:"t4", .content(text))
    }
    public static func t5(_ text:String) -> Node {
        return tag(name:"span", style_class:"t5", .content(text))
    }
    // 
    public static func (_ text:String) -> Node {
        return div(style_class:"t5", .content(text))
    }
}

let doc2 = Node.page(
    .t1("Grand titre"),
    .t2("Sous titre"),
    .t3("Titre de paragraphe"),
    .t4("Texte du paragraphe"),
    .t5("notes complémentaires")
)

var rendered = ""
render (doc2, into: &rendered)
print(rendered)
