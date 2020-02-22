# render

Simple code to define a document type, feed it with some data, and render it.

For example I take a flyer document (a.k.a leaflet, tract). `FlyerView` defines the presentation (i.e. strcture, layout, colors, fonts).  `Flyer.swift` defines the data structure. `main.swift` injects the data structure into the view to render the document.

**Motivation**

- existing libraries often have complete implementations from which I only need a small part
- reduce code to known and used code 
-  ** render** is around 30 lines of code (View.swift)


## Usage

The **flyer** example injects a `Flyer` data object into the `FlyerView` and calls the `render` method to produce an **html document**. 

`
var html = ""
View.flyer(
    Flyer(
        title: "Grand titre",
        subTitle: "Sous titre",
        partTitle: "Titre de paragraphe",
        partText: "Texte du paragraphe",
        moreInfo: "notes complémentaires"
    )
).render(into: &html)
`
The code above produce the folowwing html document :

`
<!doctype html><html><head><link rel='stylesheet' type='text/css' href='./css/root_vars_colors.css' /><link rel='stylesheet' type='text/css' href='./css/root_vars_fonts.css' /><link rel='stylesheet' type='text/css' href='./css/root_vars_layouts.css' /><link rel='stylesheet' type='text/css' href='./css/elements_html.css' /><link rel='stylesheet' type='text/css' href='./css/elements_classes.css' /><title>Flyer</title></head><body><span id='mode_color_icon' class='icon' onclick='mode_color_switch()' /><span id='mode_font_icon' class='icon' onclick='mode_font_switch()' /><span id='mode_layout_icon' class='icon' onclick='mode_layout_switch()' /><span class='t1'>Grand titre</span><span class='t2'>Sous titre</span><span class='t3'>Titre de paragraphe</span><span class='t4'>Texte du paragraphe</span><span class='t5'>notes complémentaires</span></body></html><script type='text/javascript' charset='utf-8' src='./js/mode_color.js' /><script type='text/javascript' charset='utf-8' src='./js/mode_font.js' /><script type='text/javascript' charset='utf-8' src='./js/mode_layout.js' />
`

The **flyer document** presentation is defined in `FlyerView.swift' : 

`
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
`
