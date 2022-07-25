xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/RestServiceGet_GetEstado_request";
(:: import schema at "../Resources/nxsd_schema1.xsd" ::)
declare namespace ns2="http://TargetNamespace.com/RestServiceGet_GetEstado_response";
(:: import schema at "../Resources/nxsd_schema2.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        <ns2:Estado>{fn:data($Input/ns1:Estado)}</ns2:Estado>
        <ns2:Codigo>{fn:string("123")}</ns2:Codigo>
    </ns2:Root-Element>
};

local:func($Input)
