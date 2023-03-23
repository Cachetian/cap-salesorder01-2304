using { Currency, User, managed, cuid } from '@sap/cds/common';

namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
}

entity SalesOrders : cuid, managed {
  name        : String;
  description : String;
}