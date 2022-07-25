xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="urn:enterprise.soap.sforce.com";
(:: import schema at "../../WSDL/Enterprise.wsdl" ::)

declare variable $User as xs:string external;
declare variable $Pass as xs:string external;

declare function local:func($User as xs:string, 
                            $Pass as xs:string) 
                            as element() (:: schema-element(ns1:login) ::) {
    <ns1:login>
        <ns1:username>{fn:data($User)}</ns1:username>
        <ns1:password>{fn:data($Pass)}</ns1:password>
    </ns1:login>
};

local:func($User, $Pass)
