using { valuecontract.db as db } from '../db/schema';
using { S4HANASalesContractAPI } from './external-services/s4hana-sales-contract-api';

service ValueContractService {
  // Mirror entity for S4HANASalesContractAPI.SalesContracts
  @cds.persistence.skip
  entity ExternalSalesContracts {
    key ID : UUID;
    contractId : String;
    customerId : String;
    totalAmount : Decimal;
    status : String;
  }
  
  // Key Customers management
  entity KeyCustomers as projection on db.KeyCustomers {
    *,
    contracts : redirected to ValueContracts,
    creditProfile : redirected to CreditProfiles
  };
  
  // Value Contracts management  
  @odata.draft.enabled
  entity ValueContracts as projection on db.ValueContracts {
    *,
    customer : redirected to KeyCustomers,
    assessments : redirected to CreditAssessments,
    items : redirected to ContractItems
  };
  
  // Credit Profiles
  entity CreditProfiles as projection on db.CreditProfiles {
    *,
    customer : redirected to KeyCustomers
  };
  
  // Credit Assessments
  entity CreditAssessments as projection on db.CreditAssessments {
    *,
    contract : redirected to ValueContracts
  };
  
  // Contract Items
  entity ContractItems as projection on db.ContractItems {
    *,
    contract : redirected to ValueContracts
  };
  
  // Actions for credit check process
  action triggerCreditCheck(contractID: UUID) returns String;
  action updateCreditStatus(contractID: UUID, status: String, findings: String) returns String;
  
  // Functions for reporting
  function getContractsByCustomer(customerID: UUID) returns array of ValueContracts;
  function getCustomerRiskSummary(customerID: UUID) returns {
    totalContracts: Integer;
    totalValue: Decimal;
    riskCategory: String;
    creditStatus: String;
  };

  // Function to fetch sales contracts from S/4HANA
  function fetchS4HANASalesContracts() returns array of ExternalSalesContracts;
}

// Extend the S4HANASalesContractAPI service
extend service S4HANASalesContractAPI with {
  action syncSalesContracts() returns String;
}

// Administrative service for managing master data
service AdminService {
  
  entity KeyCustomers as projection on db.KeyCustomers;
  entity ValueContracts as projection on db.ValueContracts;
  entity CreditProfiles as projection on db.CreditProfiles;
  entity CreditAssessments as projection on db.CreditAssessments;
  entity ContractItems as projection on db.ContractItems;
}
