# Render

A library to render documents. First, define the document type, then feed it with some data, then call `render`.

There is an example further down.

`render` can be used with any document types you define (html, svg, pdf ...).

## Motivation

- write reusable web components in a swift way (performance, portability, simple syntax)
- existing libraries have features or full implementations from which I only need a small part
- 'render' is around 30 lines of code (View.swift)

## The `Flyer` (a.k.a leaflet, tract) example

The flyer example defines a `Flyer` data object, then a `FlyerView` for an html type document, then calls `render` to produce the document, this way :

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

- The `FlyerView` : 

It defines the presentation (i.e. document structure, layout, colors, fonts).
It uses `HtmlView` and `View` that comes with `render`.

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

The `Flyer` data structure is injected into the `FlierView` to produce the document.

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
