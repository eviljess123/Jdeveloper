xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare variable $gaInstanceID as xs:string external;

declare function local:func($gaInstanceID as xs:string) as element() (:: schema-element(ns1:getGAInstance) ::) {
    <ns1:getGAInstance>
        <gaInstanceID>{fn:data($gaInstanceID)}</gaInstanceID>
    </ns1:getGAInstance>
};

local:func($gaInstanceID)
