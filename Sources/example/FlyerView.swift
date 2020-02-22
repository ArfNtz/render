import render

// a flyer document,
// view
public extension View {
    
    // the flyer
    static func flyer(_ f:Flyer) -> View {
        return .doc(
            .styleBar(),
            .t1(f.title),
            .t2(f.subTitle),
            .t3(f.partTitle),
            .t4(f.partText),
            .t5(f.moreInfo)
        )
    }

    // the doc structure
    static func doc(_ children:View...) -> View {
        return .doctype("html",
            .html(
                .head(
                    .stylesheet("./css/root_vars_colors.css"),
                    .stylesheet("./css/root_vars_fonts.css"),
                    .stylesheet("./css/root_vars_layouts.css"),
                    .stylesheet("./css/elements_html.css"),
                    .stylesheet("./css/elements_classes.css"),
                    .title("Flyer")
                ),
                .body(.children(views: children))
            ),
            .script("./js/mode_color.js"),
            .script("./js/mode_font.js"),
            .script("./js/mode_layout.js")
        )
    }
    // a "style bar"
    static func styleBar() -> View {
        return group(
            .element(start: "<span id='mode_color_icon' class='icon' onclick='mode_color_switch()'></span>"),
            .element(start: "<span id='mode_font_icon' class='icon' onclick='mode_font_switch()'></span>"),
            .element(start: "<span id='mode_layout_icon' class='icon' onclick='mode_layout_switch()'></span>")
        )
    }
    // some texts
    static func t1(_ text:String) -> View {
        return tag(name:"span", attributes:"class='t1'", .content(text))
    }
    static func t2(_ text:String) -> View {
        return tag(name:"span", attributes:"class='t2'", .content(text))
    }
    static func t3(_ text:String) -> View {
        return tag(name:"span", attributes:"class='t3'", .content(text))
    }
    static func t4(_ text:String) -> View {
        return tag(name:"span", attributes:"class='t4'", .content(text))
    }
    static func t5(_ text:String) -> View {
        return tag(name:"span", attributes:"class='t5'", .content(text))
    }

}
