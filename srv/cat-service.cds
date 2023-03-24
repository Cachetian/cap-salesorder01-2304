using my.bookshop as my from '../db/data-model';

service CatalogService {
    @readonly
    entity Books      as projection on my.Books;

    entity SalesOrders as projection on my.SalesOrders;

    action unboundCustomHello() returns String;

    action unboundCustomCreateSalesOrder(name: String, desc:String) returns SalesOrders;
}
