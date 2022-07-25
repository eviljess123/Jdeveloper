xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telum.mx/CommonDataModel";
(:: import schema at "../../CommonDataModel/Schemas/CDMMessages.xsd" ::)

declare namespace com = "http://telum.mx/CommonDataModel/2.0/CommonStructure";

declare namespace com1 = "http://telum.mx/CommonDataModel/2.0/Common";

declare namespace cus = "http://telum.mx/CommonDataModel/2.0/Customer";

declare variable $Code as xs:string external;
declare variable $Operation as xs:string external;
declare variable $Severity as xs:string external;
declare variable $Description as xs:string external;
declare variable $ErrorCode as xs:string external;
declare variable $Input as element() (:: schema-element(ns1:CreateCustomerPartyIM) ::) external;

declare function local:func($Code as xs:string, 
                            $Operation as xs:string, 
                            $Severity as xs:string, 
                            $Description as xs:string, 
                            $ErrorCode as xs:string, 
                            $Input as element() (:: schema-element(ns1:CreateCustomerPartyIM) ::)) 
                            as element() (:: schema-element(ns1:GeneralResponseIM) ::) {
    <ns1:GeneralResponseIM>
        <com:Header>
            {
                if ($Input/com:Header/com:BusinessMessageID)
                then <com:BusinessMessageID>{fn:data($Input/com:Header/com:BusinessMessageID)}</com:BusinessMessageID>
                else ()
            }
            {
                if ($Input/com:Header/com:MessageID)
                then <com:MessageID>{fn:data($Input/com:Header/com:MessageID)}</com:MessageID>
                else ()
            }
            {
                if ($Input/com:Header/com:Priority)
                then <com:Priority>{fn:data($Input/com:Header/com:Priority)}</com:Priority>
                else ()
            }
            {
                if ($Input/com:Header/com:DefaultLogLevel)
                then <com:DefaultLogLevel>{fn:data($Input/com:Header/com:DefaultLogLevel)}</com:DefaultLogLevel>
                else ()
            }
            {
                if ($Input/com:Header/com:GlobalActionCode)
                then <com:GlobalActionCode>{fn:data($Input/com:Header/com:GlobalActionCode)}</com:GlobalActionCode>
                else ()
            }
            <com:ResultNotification>
                <com:Code>{fn:data($Code)}</com:Code>
                <com:Operation>{fn:data($Operation)}</com:Operation>
                <com:Severity>{fn:data($Severity)}</com:Severity>
                <com:Description>{fn:data($Description)}</com:Description>
                <com:ErrorCode>{fn:data($ErrorCode)}</com:ErrorCode>
            </com:ResultNotification>
            <com:HelperFields>
                <com:Field>
                    <com1:Name></com1:Name>
                    <com1:Value></com1:Value>
                </com:Field>
            </com:HelperFields>
        </com:Header>
        <ns1:DataArea>
            <ns1:GeneralResponse>
                <ns1:ResponseFields>
                    <ns1:Field>
                        <com1:Name>AccountNo</com1:Name>
                        <com1:Value>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:AccountIDs/com1:ID)}</com1:Value>
                    </ns1:Field>
                </ns1:ResponseFields>
            </ns1:GeneralResponse>
        </ns1:DataArea>
    </ns1:GeneralResponseIM>
};

local:func($Code, $Operation, $Severity, $Description, $ErrorCode, $Input)