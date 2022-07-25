xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/WSTelefoniaM6_reserveTn_request";
(:: import schema at "../../XSD/ReserveTnRequestXSD.xsd" ::)
declare namespace ns1="http://src.oracle.com/";
(:: import schema at "../../XSD/XMLSchema_-1432463528.xsd" ::)

declare variable $input as element() (:: schema-element(ns2:Root-Element) ::) external;

declare function local:func($input as element() (:: schema-element(ns2:Root-Element) ::)) as element() (:: schema-element(ns1:reserveTn) ::) {
    <ns1:reserveTn>
        <reserveTnRequestType>
            <tnreservation>
                <externalOrderKey>{fn:data($input/ns2:ovCon)}</externalOrderKey>
                {
                    for $Numeros in $input/ns2:Numeros
                    return 
                    <telephoneNum>{fn:data($Numeros)}</telephoneNum>
                }
                <expirydate>{fn:data($input/ns2:fechaExpiracion)}</expirydate>
            </tnreservation>
        </reserveTnRequestType>
    </ns1:reserveTn>
};

local:func($input)
