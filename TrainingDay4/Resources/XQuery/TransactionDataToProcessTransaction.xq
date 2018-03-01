(:: pragma bea:mfl-element-parameter parameter="$transaction1" type="Transaction@" location="../MFLs/TransactionData.mfl" ::)
(:: pragma bea:global-element-return element="TransactionData" location="../XSDs/ProcessTransaction.xsd" ::)

declare namespace xf = "http://tempuri.org/TrainingDay4/Resources/XQuery/TransactionDataToProcessTransaction/";

declare function xf:TransactionDataToProcessTransaction($transaction1 as element())
    as element(TransactionData) {
        <TransactionData>
            {
                for $Detail in $transaction1/Header/DetailData/Detail
                return
                    <Transaction>
                        <FromAccountNo>
                        { 
                        if(data($transaction1/Header/TxnType)='SP')
                        	then  data($transaction1/Header/AcctNo)
                       	else data($Detail/FrAcctNo)
                        }
                        </FromAccountNo>
                        <FromAccountName>
                        { 
                        if(data($transaction1/Header/TxnType)='SP')
                        	then  data($transaction1/Header/AcctNm)
                       	else data($Detail/FrAcctNm)
                        }
                        </FromAccountName>
                        <ToAccountNo>{ data($Detail/ToAcctNo) }</ToAccountNo>
                        <ToAccountName>{ data($Detail/ToAcctNm) }</ToAccountName>
                        <TransactionDate>{ data($Detail/TxnDt) }</TransactionDate>
                        <TransactionCurrencyCode>{ data($transaction1/Header/AcctCurrCd) }</TransactionCurrencyCode>
                        <TransactionAmount>{ data($Detail/TxnAmt) }</TransactionAmount>
                        <ReferenceNumber>{ data($Detail/RefNo) }</ReferenceNumber>
                        <Remark>{ data($Detail/Remark) }</Remark>
                    </Transaction>
            }
        </TransactionData>
};

declare variable $transaction1 as element() external;

xf:TransactionDataToProcessTransaction($transaction1)
