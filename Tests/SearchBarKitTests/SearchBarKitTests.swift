import XCTest
import SearchBarKit

final class SearchBarKitTests: XCTestCase {
    func testSearchBarTextChange() {
        let exp = expectation(description: "Text change callback")
        let searchText = Binding<String>(
            get: { "" },
            set: { newText in
                XCTAssertEqual(newText, "Test")
                exp.fulfill()
            }
        )
        let searchBar = SearchBar(searchText: searchText)
        // Simulate text change
        searchBar.onTextChange("Test")
        wait(for: [exp], timeout: 1.0)
    }
}