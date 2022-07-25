xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.izzi.com/sfm6services/m6notificationSfxsd";
(:: import schema at "../../XSD/M6NotificationSfXSD.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:m6NotificationRequest) ::) external;
declare variable $Code as xs:int external;
declare variable $mensaje as xs:string external;
declare variable $eventStatus as xs:string external;

declare function local:func($input as element() (:: schema-element(ns1:m6NotificationRequest) ::), 
                            $Code as xs:int, 
                            $mensaje as xs:string,
                            $eventStatus as xs:string) 
                            as element() (:: schema-element(ns1:m6NotificationResponce) ::) {
    <ns1:m6NotificationResponce>
        <ns1:codigo>{fn:data($Code)}</ns1:codigo>
        <ns1:mensaje>{fn:concat(fn:data($mensaje)," PSR: ",fn:data($input/ns1:nbrPSR))}</ns1:mensaje>
        <ns1:IdSoaProcess>{fn:concat(fn:replace(fn:replace(fn:replace(fn:substring-before(xs:string(fn:current-dateTime()), '.'),'-',''),':',''),'T',''),fn:data($input/ns1:nbrPSR))}</ns1:IdSoaProcess>
        <ns1:EventEstatus>{fn:data($eventStatus)}</ns1:EventEstatus>
    </ns1:m6NotificationResponce>
};

local:func($input, $Code, $mensaje, $eventStatus)
