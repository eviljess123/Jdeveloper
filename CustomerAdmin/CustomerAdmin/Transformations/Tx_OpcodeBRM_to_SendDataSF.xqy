xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.izzi.org/SendDataSF/BpelSendDataSfXsd";
(:: import schema at "../Schemas/XMLSchema_-1859464469.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/BRM/schemas/BusinessOpcodes";
(:: import schema at "../Schemas/PCM_OP_CUST_COMMIT_CUSTOMER.xsd" ::)

declare variable $Usuario as xs:string external;
declare variable $Password as xs:string external;
declare variable $Operacion as xs:string external;
declare variable $AccountNo as xs:string external;
declare variable $IDMessage as xs:string external;
declare variable $Message as xs:string external;
declare variable $Opcode as element() (:: schema-element(ns1:PCM_OP_CUST_COMMIT_CUSTOMER_outputFlist) ::) external;

declare function local:func($Usuario as xs:string, 
                            $Password as xs:string, 
                            $Operacion as xs:string,
                            $AccountNo as xs:string,
                            $IDMessage as xs:string,
                            $Message as xs:string,
                            $Opcode as element() (:: schema-element(ns1:PCM_OP_CUST_COMMIT_CUSTOMER_outputFlist) ::)) 
                            as element() (:: schema-element(ns2:Request) ::) {
    <ns2:Request>
        <ns2:User>{fn:data($Usuario)}</ns2:User>
        <ns2:Password>{fn:data($Password)}</ns2:Password>
        <ns2:Operation>{fn:data($Operacion)}</ns2:Operation>
        <ns2:AccountNo>{fn:data($AccountNo)}</ns2:AccountNo>
        {if ($Opcode) then
        <ns2:setPoId2Account>
            <ns2:accountId>{fn:data($Opcode/ns1:ACCTINFO/ns1:AAC_SERIAL_NUM)}</ns2:accountId>
            <ns2:BRM_poidAccount>{fn:data($Opcode/ns1:ACCOUNT_OBJ)}</ns2:BRM_poidAccount>
            <ns2:BRM_poidPayInfo>{fn:data($Opcode/ns1:PAYINFO/ns1:POID)}</ns2:BRM_poidPayInfo>
            <ns2:BRM_poidAcctProfile>{fn:data($Opcode/ns1:PROFILES[1]/ns1:PROFILE_OBJ)}</ns2:BRM_poidAcctProfile>
            <ns2:BRM_Poid_Account_Info>{fn:data($Opcode/ns1:PROFILES[2]/ns1:PROFILE_OBJ)}</ns2:BRM_Poid_Account_Info>
        </ns2:setPoId2Account>
        else ()
        }
        {
        if ($Opcode) then
        <ns2:setPoId2BillUnit>
            <ns2:CollectonsetPoId2BillUnit>
                <ns2:accountId>{fn:data($Opcode/ns1:ACCTINFO/ns1:AAC_SERIAL_NUM)}</ns2:accountId>
                <ns2:BRM_poid_bill_unit_name>{fn:data($Opcode/ns1:BILLINFO/ns1:POID)}</ns2:BRM_poid_bill_unit_name>
                <ns2:billunitId>{fn:data($Opcode/ns1:BILLINFO/ns1:BILLINFO_ID)}</ns2:billunitId>
                <ns2:BRM_poidAccount>{fn:data($Opcode/ns1:ACCOUNT_OBJ)}</ns2:BRM_poidAccount>
                <ns2:BRM_poidPayInfo>{fn:data($Opcode/ns1:PAYINFO/ns1:POID)}</ns2:BRM_poidPayInfo>
                <ns2:BRM_poidAcctProfile>{fn:data($Opcode/ns1:PROFILES[1]/ns1:PROFILE_OBJ)}</ns2:BRM_poidAcctProfile>
            </ns2:CollectonsetPoId2BillUnit>
        </ns2:setPoId2BillUnit>
        else()
        }
        <ns2:UpdateSOAJobStatus>
            <ns2:pSOAJobId>{fn:data($IDMessage)}</ns2:pSOAJobId>
            <ns2:pSOAJobStatus>Completed</ns2:pSOAJobStatus>
            <ns2:JobStatusMessage>{fn:data($Message)}</ns2:JobStatusMessage>
        </ns2:UpdateSOAJobStatus>
    </ns2:Request>
};

local:func($Usuario, $Password, $Operacion, $AccountNo, $IDMessage, $Message, $Opcode)