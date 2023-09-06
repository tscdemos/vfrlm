using { bookshop } from '../db/schema.cds';

service bookshopSrv {
  entity Book as projection on bookshop.Book;
  entity Author as projection on bookshop.Author;
}