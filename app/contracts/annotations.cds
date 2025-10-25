using ValueContractService as service from '../../srv/service';
annotate service.ValueContracts with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : contractNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : contractValue,
            },
            {
                $Type : 'UI.DataField',
                Value : totalSpend,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
            },
            {
                $Type : 'UI.DataField',
                Value : creditStatus,
            },
            {
                $Type : 'UI.DataField',
                Value : lastCreditCheck,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : contractNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : contractValue,
        },
        {
            $Type : 'UI.DataField',
            Value : totalSpend,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
        },
    ],
);

annotate service.ValueContracts with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'KeyCustomers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'customerNumber',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'industry',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'riskCategory',
            },
        ],
    }
};

