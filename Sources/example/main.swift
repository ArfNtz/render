import Foundation
import render

var f = Flyer(
    title: "Grand titre",
    subTitle: "Sous titre",
    partTitle: "Titre de paragraphe",
    partText: "Texte du paragraphe",
    moreInfo: "notes complémentaires"
)

var rendered = ""

View.flyer(f).into(&rendered)

print(rendered)
