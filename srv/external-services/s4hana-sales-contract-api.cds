using { cuid } from '@sap/cds/common';

service S4HANASalesContractAPI {
    @cds.persistence.skip
    entity SalesContracts : cuid {
        contractId : String;
        customerId : String;
        totalAmount : Decimal;
        status : String;
        // Add more fields as needed based on the S/4HANA Sales Contract API
    }

    action fetchSalesContracts() returns array of SalesContracts;
}
