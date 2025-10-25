sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"valuecontract/customers/customers/test/integration/pages/KeyCustomersList",
	"valuecontract/customers/customers/test/integration/pages/KeyCustomersObjectPage"
], function (JourneyRunner, KeyCustomersList, KeyCustomersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('valuecontract/customers/customers') + '/test/flpSandbox.html#valuecontractcustomerscustomer-tile',
        pages: {
			onTheKeyCustomersList: KeyCustomersList,
			onTheKeyCustomersObjectPage: KeyCustomersObjectPage
        },
        async: true
    });

    return runner;
});

