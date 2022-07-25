xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://soap.sforce.com/schemas/class/SOAP_ContratoFacturaM6";
(:: import schema at "../../WSDL/SFContratoFacturaM6.wsdl" ::)

declare variable $sessionId as xs:string external;

declare function local:func($sessionId as xs:string) as element() (:: schema-element(ns1:SessionHeader) ::) {
    <ns1:SessionHeader>
        <ns1:sessionId>{fn:data($sessionId)}</ns1:sessionId>
    </ns1:SessionHeader>
};

local:func($sessionId)
