sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'cofco.mgrsalesorder01.mgrsalesorder01',
            componentId: 'SalesOrdersObjectPage',
            entitySet: 'SalesOrders'
        },
        CustomPageDefinitions
    );
});