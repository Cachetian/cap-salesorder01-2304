sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'cofco.mgrsalesorder01.mgrsalesorder01',
            componentId: 'SalesOrdersList',
            entitySet: 'SalesOrders'
        },
        CustomPageDefinitions
    );
});