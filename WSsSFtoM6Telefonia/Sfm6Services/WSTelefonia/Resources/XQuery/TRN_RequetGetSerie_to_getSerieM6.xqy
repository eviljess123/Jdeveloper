xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare variable $nirID as xs:string external;

declare function local:func($nirID as xs:string) as element() (:: schema-element(ns1:getSerie) ::) {
    <ns1:getSerie>
        <nirID>{fn:data($nirID)}</nirID>
    </ns1:getSerie>
};

local:func($nirID)
