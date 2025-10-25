using { valuecontract.db as db } from '../db/schema';

service ValueContractService {
  
  // Key Customers management
  entity KeyCustomers as projection on db.KeyCustomers {
    *,
    contracts : redirected to ValueContracts,
    creditProfile : redirected to CreditProfiles
  };
  
  // Value Contracts management  
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
}

// Administrative service for managing master data
service AdminService {
  
  entity KeyCustomers as projection on db.KeyCustomers;
  entity ValueContracts as projection on db.ValueContracts;
  entity CreditProfiles as projection on db.CreditProfiles;
  entity CreditAssessments as projection on db.CreditAssessments;
  entity ContractItems as projection on db.ContractItems;
}