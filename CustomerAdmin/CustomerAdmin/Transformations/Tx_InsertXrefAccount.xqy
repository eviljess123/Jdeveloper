xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/spInsertXrefAccount";
(:: import schema at "../Schemas/spInsertXrefAccount_sp.xsd" ::)

declare namespace telum="http://www.w3.org/2005/xquery-local-functions";

declare variable $pCOMMMON as xs:normalizedString external;
declare variable $pCRM as xs:normalizedString external;
declare variable $pBRM as xs:normalizedString external;

declare function telum:Tx_InsertXrefAccount($pCOMMMON as xs:normalizedString, 
                                            $pCRM as xs:normalizedString, 
                                            $pBRM as xs:normalizedString) 
                                            as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:PCOMMMON>{fn:data($pCOMMMON)}</ns1:PCOMMMON>
        <ns1:PCRM>{fn:data($pCRM)}</ns1:PCRM>
        <ns1:PBRM>{fn:data($pBRM)}</ns1:PBRM>
    </ns1:InputParameters>
};

telum:Tx_InsertXrefAccount($pCOMMMON, $pCRM, $pBRM)