xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/getGAInstancefault";
(:: import schema at "../../Schemas/ResponceGenericfault.xsd" ::)

declare variable $code as xs:string external;
declare variable $mensaje as xs:string external;

declare function local:func($code as xs:string, 
                            $mensaje as xs:string) 
                            as element() (:: schema-element(ns1:Root-Element) ::) {
    <ns1:Root-Element>
        <ns1:code>{fn:data($code)}</ns1:code>
        <ns1:mensaje>{fn:data($mensaje)}</ns1:mensaje>
    </ns1:Root-Element>
};

local:func($code, $mensaje)
