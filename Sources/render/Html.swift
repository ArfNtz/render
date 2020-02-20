// extension for simplified html tags
extension Node {
    static func doctype(_ name:String, _ children:Node...) -> Node {
        return tag(start: "<!doctype \(name)>", children: .children(nodes: children))
    }
    static func html(_ children:Node...) -> Node {
        return tag(start: "<html>", end:"</html>", children: .children(nodes: children))
    }
    static func head(_ children:Node...) -> Node {
        return .tag(start: "<head>", end: "</head>", children: .children(nodes: children))
    }
    static func title(_ t:String) -> Node {
        return .tag(start: "<title>\(t)</title>")
    }
    static func stylesheet(_ url:String) -> Node {
        return .tag(start: "<link rel='stylesheet' type='text/css' href='\(url)' />")
    }
    static func body(_ children:Node...) -> Node {
        return .tag(start: "<body>", end: "</body>", children: .children(nodes: children))
    }
    static func script(_ url:String) -> Node {
        return .tag(start: "<script type='text/javascript' charset='utf-8' src='\(url)' />")
    }
    static func tag(name:String, style_class:String, _ children:Node...) -> Node {
        return .tag(start: "<\(name) class='\(style_class)'>", end: "</\(name)>", children: .children(nodes: children))
    }
}
