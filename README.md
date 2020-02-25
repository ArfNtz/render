# Render

A library to define a document type, feed it with some data, and render it.

For example, to make a flyer document (a.k.a leaflet, tract) :
- `FlyerView.swift` defines the presentation (i.e. document structure, layout, colors, fonts).
- `Flyer.swift` defines the data structure.
- `main.swift` injects the data structure into the view and renders the document.

This example uses `HtmlView`and `View` from the **render** library.

## Motivation

- existing libraries have features or full implementations from which I only need a small part
- 'render' is around 30 lines of code (View.swift)
- write reusable web components in a simple way
- benefit from swift's simple syntax
- benefit from swift's performances as a machine code compiled langage

## The `Flyer` example

The flyer example injects a `Flyer` data object into a `FlyerView` and calls the `render` method to produce an html document, this way :

- The `Flyer` data object :
```swift
public struct Flyer {
    var title:String;
    var subTitle:String;
    var partTitle:String;
    var partText:String;
    var moreInfo:String;
}
```

- The `Flyer` view : 

```swift
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

// some texts
static func t1(_ text:String) -> View {
return tag(name:"span", attributes:"class='t1'", .content(text))
}
...
```

- A call to `render` : 

```swift
View.flyer(
    Flyer(
        title: "Grand titre",
        subTitle: "Sous titre",
        partTitle: "Titre de paragraphe",
        partText: "Texte du paragraphe",
        moreInfo: "notes complémentaires"
    )
).render(into: &html)
```

- The resulting html document, produced by `render` : 

```html
<!doctype html>
<html>

<head>
	<link rel='stylesheet' type='text/css' href='./css/root_vars_colors.css' />
	<link rel='stylesheet' type='text/css' href='./css/root_vars_fonts.css' />
	<link rel='stylesheet' type='text/css' href='./css/root_vars_layouts.css' />
	<link rel='stylesheet' type='text/css' href='./css/elements_html.css' />
	<link rel='stylesheet' type='text/css' href='./css/elements_classes.css' />
	<title>Flyer</title>
</head>

<body>
  <span id='mode_color_icon' class='icon' onclick='mode_color_switch()'></span>
  <span id='mode_font_icon' class='icon' onclick='mode_font_switch()'></span>
  <span id='mode_layout_icon' class='icon' onclick='mode_layout_switch()'></span>
  <span class='t1'>Grand titre</span><span class='t2'>Sous titre</span>
  <span class='t3'>Titre de paragraphe</span>
  <span class='t4'>Texte du paragraphe</span>
  <span class='t5'>notes complémentaires</span>
</body>

</html>
<script type='text/javascript' charset='utf-8' src='./js/mode_color.js' async></script>
<script type='text/javascript' charset='utf-8' src='./js/mode_font.js' async></script>
<script type='text/javascript' charset='utf-8' src='./js/mode_layout.js' async></script>
```
