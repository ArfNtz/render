// extension to define custom doc components
extension Node {
    // the doc itself
    public static func doc(_ children:Node...) -> Node {
        return .doctype("html",
            .html(
                .head(
                    .stylesheet("./css/root_vars_colors.css"),
                    .stylesheet("./css/root_vars_fonts.css"),
                    .stylesheet("./css/root_vars_layouts.css"),
                    .stylesheet("./css/elements_html.css"),
                    .stylesheet("./css/elements_classes.css"),
                    .title("")
                ),
                .body(.children(nodes: children))
            ),
            .script("./js/mode_color.js"),
            .script("./js/mode_font.js"),
            .script("./js/mode_layout.js")
        )
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
    // style bar
    public static func styleBar() -> Node {
        return group(
            .tag(start: "<span id='mode_color_icon' class='icon' onclick='mode_color_switch()' />"),
            .tag(start: "<span id='mode_font_icon' class='icon' onclick='mode_font_switch()' />"),
            .tag(start: "<span id='mode_layout_icon' class='icon' onclick='mode_layout_switch()' />")
        )
    }

}
