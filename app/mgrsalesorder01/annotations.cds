using CatalogService as service from '../../srv/cat-service';
annotate service.SalesOrders with @(
    UI.SelectionFields : [
        name,
        description,
    ]
);

annotate service.SalesOrders with {
    name @Common.Label : '{i18n>Name1}'
};


annotate service.SalesOrders with {
    description @Common.Label : 'description'
};
annotate service.SalesOrders with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.EntityContainer/unboundCustomHello',
            Label : 'Hello',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.EntityContainer/unboundCustomCreateSalesOrder',
            Label : 'Create New',
        },
    ]
);
annotate service.SalesOrders with @(
    UI.HeaderInfo : {
        TypeName : 'Sales Order',
        TypeNamePlural : 'Sales Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    }
);
annotate service.SalesOrders with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Basic Info',
            ID : 'BasicInfo',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Order Info',
                    ID : 'OrderInfo',
                    Target : '@UI.FieldGroup#OrderInfo',
                },],
        },
    ]
);
annotate service.SalesOrders with @(
    UI.FieldGroup #OrderInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },{
                $Type : 'UI.DataField',
                Value : description,
            },],
    }
);
