(:: pragma bea:global-element-parameter parameter="$transactionData1" element="TransactionData" location="../XSDs/ProcessTransaction.xsd" ::)
(:: pragma bea:mfl-element-return type="TransactionResult@" location="../MFLs/TransactionResult.mfl" ::)

declare namespace xf = "http://tempuri.org/TrainingDay4/Resources/XQuery/x/";

declare function xf:x($transactionData1 as element(TransactionData))
    as element() {
        let $TransactionData := $transactionData1
        return
            <TransactionResult>
                {
                    for $Transaction in $TransactionData/Transaction
                    return
                        <Transaction>
                            <TransactionDate>{ data($Transaction/TransactionDate) }</TransactionDate>
                            <ReferenceNumber>{ data($Transaction/ReferenceNumber) }</ReferenceNumber>
                            <FromAccountNo>{ data($Transaction/FromAccountNo) }</FromAccountNo>
                            <FromAccountName>{ data($Transaction/FromAccountName) }</FromAccountName>
                            <ToAccountNo>{ data($Transaction/ToAccountNo) }</ToAccountNo>
                            <ToAccountName>{ data($Transaction/ToAccountName) }</ToAccountName>
                            <TransactionCurrencyCode>{ data($Transaction/TransactionCurrencyCode) }</TransactionCurrencyCode>
                            <TransactionAmount>{ data($Transaction/TransactionAmount) }</TransactionAmount>
                            <Remark>{ data($Transaction/Remark) }</Remark>
                            <Status>SUCCESS</Status>
                        </Transaction>
                }
            </TransactionResult>
};

declare variable $transactionData1 as element(TransactionData) external;

xf:x($transactionData1)
