xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/OrderManagmentService_procesarOrden_response";
(:: import schema at "../../XSD/OrderManagmentResponse.xsd" ::)

declare variable $IdMesssage as xs:string external;
declare variable $message as xs:string external;
declare variable $code as xs:string external;

declare function local:func($IdMesssage as xs:string, 
                            $message as xs:string, 
                            $code as xs:string) 
                            as element() (:: schema-element(ns1:Root-Element) ::) {
    <ns1:Root-Element>
        <ns1:code>{fn:data($code)}</ns1:code>
        <ns1:idProccess>{fn:data($IdMesssage)}</ns1:idProccess>
        <ns1:message>{fn:data($message)}</ns1:message>
    </ns1:Root-Element>
};

local:func($IdMesssage, $message, $code)