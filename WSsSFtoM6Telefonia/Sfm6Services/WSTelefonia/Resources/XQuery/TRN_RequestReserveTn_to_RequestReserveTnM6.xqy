xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/WSTelefoniaReserveTnRequest";
(:: import schema at "../../Schemas/ReserveTnRequestXSD.xsd" ::)
declare namespace ns2="http://src.oracle.com/";
(:: import schema at "../../Schemas/XMLSchema_-1432463528.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:reserveTn) ::) {
    <ns2:reserveTn>
        <reserveTnRequestType>
            <tnreservation>
                <externalOrderKey>{fn:data($Input/ns1:ovCon)}</externalOrderKey>
                {
                    for $Numeros in $Input/ns1:Numeros
                    return 
                    <telephoneNum>{fn:data($Numeros)}</telephoneNum>
                }
                <expirydate>{fn:data($Input/ns1:fechaExpiracion)}</expirydate>
            </tnreservation>
        </reserveTnRequestType>
    </ns2:reserveTn>
};

local:func($Input)
