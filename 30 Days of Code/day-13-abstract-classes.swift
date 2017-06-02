//
//  So... Swift does not support abstract classes so I had to do this challenge in c++.
//  Thats it for the 'Swift only' solutions! Thanks HackerRank <3
//

class MyBook: Book{

    public:
        int price;
        MyBook(string t, string a, int p): Book(t, a){
            price = p;
        }

    void display(){
        std::cout << "Title: " << title << endl << "Author: " << author << endl << "Price: " << price;
    }

};

//
//  P.S. My heart is broken... ;_; [*]
//
