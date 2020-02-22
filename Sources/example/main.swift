import Foundation
import render

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

print(html)
