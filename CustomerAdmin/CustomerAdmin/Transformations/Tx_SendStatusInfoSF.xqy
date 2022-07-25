xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.izzi.org/SendDataSF/BpelSendDataSfXsd";
(:: import schema at "../Schemas/XMLSchema_-1859464469.xsd" ::)

declare variable $Usuario as xs:string external;
declare variable $Password as xs:string external;
declare variable $AccountNo as xs:string external;
declare variable $IDMesage as xs:string external;
declare variable $Operation as xs:string external;
declare variable $Status as xs:string external;
declare variable $Message as xs:string external;

declare function local:func($Usuario as xs:string, 
                            $Password as xs:string, 
                            $AccountNo as xs:string, 
                            $IDMesage as xs:string,
                            $Operation as xs:string,
                            $Status as xs:string,
                            $Message as xs:string) 
                            as element() (:: schema-element(ns1:Request) ::) {
    <ns1:Request>
        <ns1:User>{fn:data($Usuario)}</ns1:User>
        <ns1:Password>{fn:data($Password)}</ns1:Password>
        <ns1:Operation>{fn:data($Operation)}</ns1:Operation>
        <ns1:AccountNo>{fn:data($AccountNo)}</ns1:AccountNo>
        <ns1:UpdateSOAJobStatus>
            <ns1:pSOAJobId>{fn:data($IDMesage)}</ns1:pSOAJobId>
            <ns1:pSOAJobStatus>{fn:data($Status)}</ns1:pSOAJobStatus>
            <ns1:JobStatusMessage>{fn:data($Message)}</ns1:JobStatusMessage>
        </ns1:UpdateSOAJobStatus>
    </ns1:Request>
};

local:func($Usuario, $Password, $AccountNo, $IDMesage, $Operation, $Status, $Message)