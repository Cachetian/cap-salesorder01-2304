sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cofco/mgrsalesorder01/mgrsalesorder01/test/integration/FirstJourney',
		'cofco/mgrsalesorder01/mgrsalesorder01/test/integration/pages/SalesOrdersList',
		'cofco/mgrsalesorder01/mgrsalesorder01/test/integration/pages/SalesOrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrdersList, SalesOrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cofco/mgrsalesorder01/mgrsalesorder01') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrdersList: SalesOrdersList,
					onTheSalesOrdersObjectPage: SalesOrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);