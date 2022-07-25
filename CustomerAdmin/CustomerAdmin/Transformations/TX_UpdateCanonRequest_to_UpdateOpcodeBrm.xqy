xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telum.mx/CommonDataModel";
(:: import schema at "../../CommonDataModel/Schemas/CDMMessages.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/BRM/schemas/BusinessOpcodes";
(:: import schema at "../Schemas/PCM_OP_CUST_UPDATE_CUSTOMER.xsd" ::)

declare namespace cus = "http://telum.mx/CommonDataModel/2.0/Customer";

declare namespace com = "http://telum.mx/CommonDataModel/2.0/Common";

declare variable $PoidAccount as xs:string external;
declare variable $PoidProfileAccount as xs:string external;
declare variable $PoidProfileExtrating as xs:string external;
declare variable $Gl_Segment as xs:string external;
declare variable $COUNTRY as xs:string external;
declare variable $XmlRequest as element() (:: schema-element(ns1:ModifyCustomerPartyIM) ::) external;

declare function local:func($PoidAccount as xs:string, 
                            $PoidProfileAccount as xs:string, 
                            $PoidProfileExtrating as xs:string, 
                            $Gl_Segment as xs:string, 
                            $COUNTRY as xs:string,
                            $XmlRequest as element() (:: schema-element(ns1:ModifyCustomerPartyIM) ::)) 
                            as element() (:: schema-element(ns2:PCM_OP_CUST_UPDATE_CUSTOMER_inputFlist) ::) {
    <ns2:PCM_OP_CUST_UPDATE_CUSTOMER_inputFlist>
        <ns2:ACCOUNT_OBJ>{fn:data($PoidAccount)}</ns2:ACCOUNT_OBJ>
        <ns2:ACCTINFO>
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:Name = 'idClienteSAP']/com:ID)
                then <ns2:AAC_ACCESS>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:Name = 'idClienteSAP']/com:ID)}</ns2:AAC_ACCESS>
                else ()
            }
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:Name = 'claveCliente']/com:ID)
                then <ns2:ACCESS_CODE1>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:Name = 'claveCliente']/com:ID)}</ns2:ACCESS_CODE1>
                else ()
            }
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:OracleId)
                then <ns2:ACCESS_CODE2>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:OracleId)}</ns2:ACCESS_CODE2>
                else ()
            }
            <ns2:GL_SEGMENT>{fn:data($Gl_Segment)}</ns2:GL_SEGMENT>
            <ns2:POID>{fn:data($PoidAccount)}</ns2:POID>
        </ns2:ACCTINFO>
        <ns2:NAMEINFO elem="1">
            <ns2:ADDRESS>{fn:data(fn:concat($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:StreetName,'|',$XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:StreetNumberLast,'|',$XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:StreetNumberFirst,'|',$XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:SubUrbName))}</ns2:ADDRESS>
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:CityName)
                then <ns2:CITY>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:CityName)}</ns2:CITY>
                else ()
            }
            <ns2:COMPANY>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:Organization/com:TradingName)}</ns2:COMPANY>
            <ns2:COUNTRY>{fn:data($COUNTRY)}</ns2:COUNTRY>
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:ContextID = 'Common']/com:Name)
                then <ns2:FIRST_NAME>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:ContextID = 'Common']/com:Name)}</ns2:FIRST_NAME>
                else ()
            }
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:ContextID = 'Common']/com:Name)
                then <ns2:LAST_NAME>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:AccountID[com:ContextID = 'Common']/com:Name)}</ns2:LAST_NAME>
                else ()
            }
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:StateName)
                then <ns2:STATE>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:StateName)}</ns2:STATE>
                else ()
            }
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:Organization/com:FederalTaxId)
                then <ns2:TITLE>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:Organization/com:FederalTaxId)}</ns2:TITLE>
                else ()
            }
            {
                if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:ZipCode)
                then <ns2:ZIP>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:ZipCode)}</ns2:ZIP>
                else ()
            }
        </ns2:NAMEINFO>
        <ns2:POID>{fn:data($PoidAccount)}</ns2:POID>
        <ns2:PROFILES elem="0">
            <ns2:INHERITED_INFO>
                <ns2:BST_FLD_INE>
                    <ns2:BST_FLD_INE_AMBIT></ns2:BST_FLD_INE_AMBIT>
                    <ns2:BST_FLD_INE_CODE></ns2:BST_FLD_INE_CODE>
                    <ns2:BST_FLD_INE_COMMITEE></ns2:BST_FLD_INE_COMMITEE>
                    <ns2:BST_FLD_INE_ID_ACCOUNTING></ns2:BST_FLD_INE_ID_ACCOUNTING>
                    <ns2:BST_FLD_INE_PROCESS></ns2:BST_FLD_INE_PROCESS>
                </ns2:BST_FLD_INE>
                <ns2:BST_FLD_PROFILE_ACCOUNT>
                    {
                        if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ID)
                        then <ns2:BANK_ACCOUNT_NO>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ID)}</ns2:BANK_ACCOUNT_NO>
                        else ()
                    }
                    {
                        if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ClasificationCode)
                        then <ns2:BST_FLD_BANK_CLABE>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ClasificationCode)}</ns2:BST_FLD_BANK_CLABE>
                        else ()
                    }
                    {
                        if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:ListOfCustomerPartyBillingProfiles/cus:CustomerPartyBillingProfile[1]/cus:InvoiceIndicator)
                        then <ns2:BST_FLD_BUSINESS_SEGMENT>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:ListOfCustomerPartyBillingProfiles/cus:CustomerPartyBillingProfile[1]/cus:InvoiceIndicator)}</ns2:BST_FLD_BUSINESS_SEGMENT>
                        else ()
                    }
                    {
                        if ($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:SegmentoVtas)
                        then <ns2:BST_FLD_SALES_SEGMENT>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:SegmentoVtas)}</ns2:BST_FLD_SALES_SEGMENT>
                        else ()
                    }
                </ns2:BST_FLD_PROFILE_ACCOUNT>
            </ns2:INHERITED_INFO>
            <ns2:PROFILE_OBJ>{fn:data($PoidProfileAccount)}</ns2:PROFILE_OBJ>
        </ns2:PROFILES>
        <ns2:PROFILES elem="1">
                <ns2:INHERITED_INFO>
                    <ns2:DATA_ARRAY elem="1">
                        <ns2:NAME>SEGMENT_ACCT</ns2:NAME>
                        <ns2:VALUE>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:ListOfCustomerPartyBillingProfiles/cus:CustomerPartyBillingProfile[1]/cus:InvoiceIndicator)}</ns2:VALUE>
                        <ns2:VALID_FROM/>
                        <ns2:VALID_TO/>
                    </ns2:DATA_ARRAY>
                    <ns2:DATA_ARRAY elem="2">
                        <ns2:NAME>AGING_CDR</ns2:NAME>
                        <ns2:VALUE>1</ns2:VALUE>
                        <ns2:VALID_FROM/>
                        <ns2:VALID_TO/>
                    </ns2:DATA_ARRAY>
                    <ns2:DATA_ARRAY elem="3">
                        <ns2:NAME>CITY</ns2:NAME>
                        <ns2:VALUE>{fn:data($XmlRequest/ns1:DataArea/ns1:ModifyCustomerParty/cus:CustomerPartyLocation/com:CityName)}</ns2:VALUE>
                        <ns2:VALID_FROM/>
                        <ns2:VALID_TO/>
                    </ns2:DATA_ARRAY>
                </ns2:INHERITED_INFO>
                <ns2:PROFILE_OBJ>{fn:data($PoidProfileExtrating)}</ns2:PROFILE_OBJ>
            </ns2:PROFILES>
            <PROGRAM_NAME>SOA</PROGRAM_NAME>
    </ns2:PCM_OP_CUST_UPDATE_CUSTOMER_inputFlist>
};

local:func($PoidAccount, $PoidProfileAccount, $PoidProfileExtrating, $Gl_Segment, $COUNTRY, $XmlRequest)