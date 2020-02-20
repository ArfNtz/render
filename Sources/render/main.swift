public enum Node {
    indirect case tag(start:String, end:String, children:Node)
    case children(nodes:[Node])
    case content(String)
}

public func render(_ node: Node, into r: inout String) {
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

let doc = Node.tag(start:"<html>", end:"</html>", children:
    .tag(start:"<body>", end:"</body>", children:
        .tag(start:"<span>", end:"</span>", children:
            .children(nodes:[
                .content("One"),
                .content("Bis")
            ])            
        )
    )
)

var rendered = ""
render (doc, into: &rendered)
print(rendered)
