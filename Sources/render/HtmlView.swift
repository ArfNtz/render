// extension for simplified html tags
public extension View {
    static func doctype(_ name:String, _ children:View...) -> View {
        return element(start: "<!doctype \(name)>", children: .children(views: children))
    }
    static func html(_ children:View...) -> View {
        return element(start: "<html>", end:"</html>", children: .children(views: children))
    }
    static func head(_ children:View...) -> View {
        return .element(start: "<head>", end: "</head>", children: .children(views: children))
    }
    static func title(_ t:String) -> View {
        return .element(start: "<title>\(t)</title>")
    }
    static func stylesheet(_ url:String) -> View {
        return .element(start: "<link rel='stylesheet' type='text/css' href='\(url)'/>")
    }
    static func body(_ children:View...) -> View {
        return .element(start: "<body>", end: "</body>", children: .children(views: children))
    }
    static func script(_ url:String) -> View {
        return .element(start: "<script type='text/javascript' charset='utf-8' src='\(url)' async>", end: "</script>")
    }
    static func tag(name:String, attributes:String, _ children:View...) -> View {
        return .element(start: "<\(name) \(attributes)>", end: "</\(name)>", children: .children(views: children))
    }
}
