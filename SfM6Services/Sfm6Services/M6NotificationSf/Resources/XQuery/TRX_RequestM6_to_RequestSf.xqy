xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://soap.sforce.com/schemas/class/SOAP_ContratoFacturaM6";
(:: import schema at "../../WSDL/SFContratoFacturaM6.wsdl" ::)
declare namespace ns1="http://www.izzi.com/sfm6services/m6notificationSfxsd";
(:: import schema at "../../XSD/M6NotificationSfXSD.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:m6NotificationRequest) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:m6NotificationRequest) ::)) as element() (:: schema-element(ns2:contratoFactura) ::) {
    <ns2:contratoFactura>
        <ns2:OVConsecutivo>{fn:data($Input/ns1:OVConsecutivo)}</ns2:OVConsecutivo>
        <ns2:oportunidad>{fn:data($Input/ns1:oportunidad)}</ns2:oportunidad>
        <ns2:nbrPSR>{fn:data($Input/ns1:nbrPSR)}</ns2:nbrPSR>
        <ns2:descripcion>{fn:data($Input/ns1:descripcion)}</ns2:descripcion>
        {
        for $cidSf in $Input/ns1:ServiciosCollection/ns1:Servicio
        return
        <ns2:cidSalesforce>{fn:data($cidSf/ns1:cidSalesforce)}</ns2:cidSalesforce>
        }
        {
        for $cidSf in $Input/ns1:ServiciosCollection/ns1:Servicio
        return
        <ns2:cktidM6>{fn:data($cidSf/ns1:cktidM6)}</ns2:cktidM6>
        }
        
    </ns2:contratoFactura>
};

local:func($Input)
