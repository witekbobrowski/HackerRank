//
//  So... Swift does not support abstract classes so I had to do this challenge in c++.
//
//     class MyBook: Book{
//
//          public:
//              int price;
//              MyBook(string t, string a, int p): Book(t, a){
//                  price = p;
//              }
//          void display(){
//              std::cout << "Title: " << title << endl << "Author: " << author << endl << "Price: " << price;
//          }
//
//      };
//
//  But here is the Swift solution:
//

protocol Book {

    var title: String { get set }
    var author: String { get set }

    init(title: String, author: String)

    func display()

}

class MyBook: Book {

    var title: String
    var author: String
    var price: Int?

    required init(title: String, author: String) {
        self.title = title
        self.author = author
    }

    convenience init(title: String, author: String, price: Int) {
        self.init(title: title, author: author)
        self.price = price
    }

    func display() {
        print("Title: \(title)\nAuthor: \(author)\nPrice: \(price ?? 0 )")
    }

}

let book = MyBook(title: readLine()!, author: readLine()!, price: Int(readLine()!)!)
book.display()
