xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/getASLRequest";
(:: import schema at "../../Schemas/getASLRequest.xsd" ::)
declare namespace ns2="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:getASL) ::) {
    <ns2:getASL>
        <paisID>{fn:data($Input/ns1:paisID)}</paisID>
        <edoID>{fn:data($Input/ns1:edoID)}</edoID>
        <munID>{fn:data($Input/ns1:munID)}</munID>
    </ns2:getASL>
};

local:func($Input)
