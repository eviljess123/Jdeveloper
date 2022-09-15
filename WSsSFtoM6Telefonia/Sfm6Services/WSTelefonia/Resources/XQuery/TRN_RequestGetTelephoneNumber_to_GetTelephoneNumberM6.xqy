xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/ServiceName";
(:: import schema at "../../Schemas/GetTelephoneNumber.xsd" ::)
declare namespace ns2="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:getTelephoneNumber) ::) {
    <ns2:getTelephoneNumber>
        <nirID>{fn:data($Input/ns1:nirID)}</nirID>
        <serieID>{fn:data($Input/ns1:serieID)}</serieID>
        <lowRange>{fn:data($Input/ns1:lowRange)}</lowRange>
        <upRange>{fn:data($Input/ns1:upRange)}</upRange>
        <cnt>{fn:data($Input/ns1:cnt)}</cnt>
        <checkOutIndicator>{fn:data($Input/ns1:checkOutIndicator)}</checkOutIndicator>
    </ns2:getTelephoneNumber>
};

local:func($Input)
