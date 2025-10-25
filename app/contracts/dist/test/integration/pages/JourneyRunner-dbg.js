sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"valuecontract/contracts/contracts/test/integration/pages/ValueContractsList",
	"valuecontract/contracts/contracts/test/integration/pages/ValueContractsObjectPage"
], function (JourneyRunner, ValueContractsList, ValueContractsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('valuecontract/contracts/contracts') + '/test/flpSandbox.html#valuecontractcontractscontract-tile',
        pages: {
			onTheValueContractsList: ValueContractsList,
			onTheValueContractsObjectPage: ValueContractsObjectPage
        },
        async: true
    });

    return runner;
});

