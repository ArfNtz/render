import XCTest
@testable import render

final class renderTests: XCTestCase {
    func testExample() throws {
        
        // layout some data
        var rendered = ""

        Node.doc(
            .styleBar(),
            .t1("Grand titre"),
            .t2("Sous titre"),
            .t3("Titre de paragraphe"),
            .t4("Texte du paragraphe"),
            .t5("notes complémentaires")
        )
        .render(into: &rendered)

        print(rendered)

    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
