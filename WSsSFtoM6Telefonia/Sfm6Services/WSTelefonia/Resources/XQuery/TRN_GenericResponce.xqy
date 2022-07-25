xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/WSTelefoniaGenericResponce";
(:: import schema at "../../Schemas/GenericResponceXSD.xsd" ::)

declare variable $code as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $IdSoaProcess as xs:string external;
declare variable $EventEstatus as xs:string external;

declare function local:func($code as xs:string, 
                            $mensaje as xs:string, 
                            $IdSoaProcess as xs:string, 
                            $EventEstatus as xs:string) 
                            as element() (:: schema-element(ns1:Root-Element) ::) {
    <ns1:Root-Element>
        <ns1:code>{fn:data($code)}</ns1:code>
        <ns1:mensaje>{fn:data($mensaje)}</ns1:mensaje>
        <ns1:IdSoaProcess>{fn:data($IdSoaProcess)}</ns1:IdSoaProcess>
        <ns1:EventEstatus>{fn:data($EventEstatus)}</ns1:EventEstatus>
    </ns1:Root-Element>
};

local:func($code, $mensaje, $IdSoaProcess, $EventEstatus)
