xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://mmredes";
(:: import schema at "../WSDLs/WSBRMAdapter.wsdl" ::)

declare namespace ent = "http://entities.adapter.mmredes.com";

declare variable $message as xs:string external;
declare variable $Opcode as xs:string external;
declare variable $OpcodeSchema as xs:string external;

declare function local:func($message as xs:string, 
                            $Opcode as xs:string, 
                            $OpcodeSchema as xs:string) 
                            as element() (:: schema-element(ns1:executeMultipleOpcodesNoPool) ::) {
    <ns1:executeMultipleOpcodesNoPool>
        <ns1:opcodeCommandList>
            <ent:descService></ent:descService>
            <ent:endT></ent:endT>
            <ent:flags>0</ent:flags>
            <ent:inputValidation>0</ent:inputValidation>
            <ent:isBaseOpcode>0</ent:isBaseOpcode>
            <ent:message>{fn:data($message)}</ent:message>
            <ent:numOrder></ent:numOrder>
            <ent:opcode>{fn:data($Opcode)}</ent:opcode>
            <ent:opcodeSchema>{fn:data($OpcodeSchema)}</ent:opcodeSchema>
            <ent:outputValidation>0</ent:outputValidation>
            <ent:serviceObj></ent:serviceObj>
        </ns1:opcodeCommandList>
    </ns1:executeMultipleOpcodesNoPool>
};

local:func($message, $Opcode, $OpcodeSchema)