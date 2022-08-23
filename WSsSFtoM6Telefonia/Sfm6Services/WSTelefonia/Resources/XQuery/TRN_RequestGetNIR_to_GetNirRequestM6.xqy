xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare variable $aslID as xs:string external;

declare function local:func($aslID as xs:string) as element() (:: schema-element(ns1:getNIR) ::) {
    <ns1:getNIR>
        <aslID>{fn:data($aslID)}</aslID>
    </ns1:getNIR>
};

local:func($aslID)
