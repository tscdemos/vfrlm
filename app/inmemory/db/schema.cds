namespace bookshop;

entity Book {
  key ID: UUID;
  title: String(200);
  pageCount: Integer;
  author: Association to Author;
  pages: Composition of many Page on pages.book = $self;
}

entity Author {
  key ID: UUID;
  firstName: String(190);
  lastName: String(190);
  birthDate: Date;
  books: Association to many Book on books.author = $self;
}

entity Page {
  key ID: UUID;
  wordCount: Integer;
  book: Association to Book;
}

