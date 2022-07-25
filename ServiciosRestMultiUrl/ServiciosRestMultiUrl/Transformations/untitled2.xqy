xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/RestServiceGet_Operation1_request";
(:: import schema at "../Resources/nxsd_schema3.xsd" ::)
declare namespace ns2="http://TargetNamespace.com/RestServiceGet_Operation1_response";
(:: import schema at "../Resources/nxsd_schema4.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        <ns2:Ciudad>{fn:data($Input/ns1:Ciudad)}</ns2:Ciudad>
        <ns2:Codigo>{xs:string("321")}</ns2:Codigo>
    </ns2:Root-Element>
};

local:func($Input)
