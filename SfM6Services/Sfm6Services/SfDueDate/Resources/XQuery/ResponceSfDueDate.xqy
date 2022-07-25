xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/SfDueDate_duedate_request";
(:: import schema at "../../XSD/RequestSfDueDateXSD.xsd" ::)
declare namespace ns2="http://TargetNamespace.com/SfDueDate_duedate_response";
(:: import schema at "../../XSD/ResponceSfDueDate.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:Root-Element) ::) external;
declare variable $Code as xs:string external;
declare variable $Mensaje as xs:string external;
declare variable $EventEstatus as xs:string external;

declare function local:func($input as element() (:: schema-element(ns1:Root-Element) ::), 
                            $Code as xs:string, 
                            $Mensaje as xs:string,
                            $EventEstatus as xs:string) 
                            as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        <ns2:code>{fn:data($Code)}</ns2:code>
        <ns2:mensaje>{fn:concat(fn:data($Mensaje)," PSR: ",fn:data($input/ns1:nbrPSR))}</ns2:mensaje>
        <ns2:IdSoaProcess>{fn:concat(fn:replace(fn:replace(fn:replace(fn:substring-before(xs:string(fn:current-dateTime()), '.'),'-',''),':',''),'T',''),fn:data($input/ns1:nbrPSR))}</ns2:IdSoaProcess>
        <ns2:EventEstatus>{fn:data($EventEstatus)}</ns2:EventEstatus>
    </ns2:Root-Element>
};

local:func($input, $Code, $Mensaje, $EventEstatus)
