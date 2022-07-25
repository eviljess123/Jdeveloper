xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/WSTelefoniaM6_UpdateReservationRequest_request";
(:: import schema at "../../XSD/UpdateReservationRequestXSD.xsd" ::)
declare namespace ns2="http://src.oracle.com/";
(:: import schema at "../../XSD/XMLSchema_-1486410019.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:updateReservationRequest) ::) {
    <ns2:updateReservationRequest>
        <updateReservationRequestType>
            <action>{fn:data($Input/ns1:accion)}</action>
            <reservationId>{fn:data($Input/ns1:idReservacion)}</reservationId>
            <expirydate>{fn:data($Input/ns1:fechaExpiracion)}</expirydate>
        </updateReservationRequestType>
    </ns2:updateReservationRequest>
};

local:func($Input)
