xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/ServiceName";
(:: import schema at "Responce.xsd" ::)

declare variable $Mensaje as xs:string external;

declare function local:func($Mensaje as xs:string) as element() (:: schema-element(ns1:Root-Element) ::) {
    <ns1:Root-Element>
        <ns1:code></ns1:code>
        <ns1:mensaje>{fn:data($Mensaje)}</ns1:mensaje>
        <ns1:IdSoaProcess></ns1:IdSoaProcess>
        <ns1:EventEstatus></ns1:EventEstatus>
    </ns1:Root-Element>
};

local:func($Mensaje)
