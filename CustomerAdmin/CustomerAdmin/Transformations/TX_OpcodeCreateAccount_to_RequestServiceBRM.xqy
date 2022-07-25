xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://mmredes";
(:: import schema at "../WSDLs/WSBRMAdapter.wsdl" ::)
declare namespace ns2="http://telum.mx/CommonDataModel";
(:: import schema at "../../CommonDataModel/Schemas/CDMMessages.xsd" ::)

declare namespace ent = "http://entities.adapter.mmredes.com";

declare variable $message as xs:string external;
declare variable $opcode as xs:string external;
declare variable $opcodeSchema as xs:string external;
declare variable $Input as element() (:: schema-element(ns2:CreateCustomerPartyIM) ::) external;

declare function local:func($message as xs:string, 
                            $opcode as xs:string, 
                            $opcodeSchema as xs:string, 
                            $Input as element() (:: schema-element(ns2:CreateCustomerPartyIM) ::)) 
                            as element() (:: schema-element(ns1:executeMultipleOpcodesNoPool) ::) {
    <ns1:executeMultipleOpcodesNoPool>
        <ns1:opcodeCommandList>
            <ent:descService></ent:descService>
            <ent:endT></ent:endT>
            <ent:flags>0</ent:flags>
            <ent:inputValidation>0</ent:inputValidation>
            <ent:isBaseOpcode>0</ent:isBaseOpcode>
            <ent:message>{fn:replace((fn:replace((fn:replace(fn:data($message), '<ns2:PCM_OP_CUST_COMMIT_CUSTOMER_inputFlist xmlns:ns2="http://xmlns.oracle.com/BRM/schemas/BusinessOpcodes">', '<flist>')), '</ns2:PCM_OP_CUST_COMMIT_CUSTOMER_inputFlist>', '</flist>')), 'ns2:', '')}</ent:message>
            <ent:numOrder></ent:numOrder>
            <ent:opcode>{fn:data($opcode)}</ent:opcode>
            <ent:opcodeSchema>{fn:data($opcodeSchema)}</ent:opcodeSchema>
            <ent:outputValidation>0</ent:outputValidation>
            <ent:serviceObj></ent:serviceObj>
        </ns1:opcodeCommandList>
    </ns1:executeMultipleOpcodesNoPool>
};

local:func($message, $opcode, $opcodeSchema, $Input)