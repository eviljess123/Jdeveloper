xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/RestService_Operation1_request";
(:: import schema at "nxsd_schema1.xsd" ::)
declare namespace ns2="http://TargetNamespace.com/RestService_Operation1_response";
(:: import schema at "nxsd_schema2.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        <ns2:Respuesta>{fn:data($input/ns1:XML)}</ns2:Respuesta>
    </ns2:Root-Element>
};

local:func($input)
