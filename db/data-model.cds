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
entity SalesOrderHeaders : cuid, managed {
  CurrencyCode        : String(5);
  GrossAmount         : Decimal(15, 3);
  LifeCycleStatus     : String(1) not null;
  LifeCycleStatusName : String(255) not null;
  NetAmount           : Decimal(15, 3);
  TaxAmount           : Decimal(15, 3);
  Items               : Association to many SalesOrderItems
                          on Items.Header = $self;
}

entity SalesOrderItems {
  key Id           : UUID
      @Core.Computed;
      CurrencyCode : String(5);
      DeliveryDate : DateTime;
      GrossAmount  : Decimal(15, 3);
      NetAmount    : Decimal(15, 3);
      Quantity     : Decimal(15, 3);
      QuantityUnit : String(3);
      TaxAmount    : Decimal(15, 3);
      Header       : Association to one SalesOrderHeaders;
}
