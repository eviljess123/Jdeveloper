xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telum.mx/CommonDataModel";
(:: import schema at "../../CommonDataModel/Schemas/CDMMessages.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/BRM/schemas/BusinessOpcodes";
(:: import schema at "../Schemas/PCM_OP_CUST_COMMIT_CUSTOMER.xsd" ::)

declare namespace cus = "http://telum.mx/CommonDataModel/2.0/Customer";

declare namespace com = "http://telum.mx/CommonDataModel/2.0/Common";

declare variable $Input as element() (:: schema-element(ns1:CreateCustomerPartyIM) ::) external;
declare variable $CURRENCY as xs:string external;
declare variable $COUNTRY as xs:string external;

declare function local:func($Input as element() (:: schema-element(ns1:CreateCustomerPartyIM) ::), 
                            $CURRENCY as xs:string, 
                            $COUNTRY as xs:string) 
                            as element() (:: schema-element(ns2:PCM_OP_CUST_COMMIT_CUSTOMER_inputFlist) ::) {
    <ns2:PCM_OP_CUST_COMMIT_CUSTOMER_inputFlist>
        
        {
        let
        $AccountNo := fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:AccountIDs[1]/com:ID),
        $IdSalesForce := fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:AccountIDs[2]/com:ID),
        $claveCliente := fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:AccountIDs[com:Name = 'claveCliente']/com:ID),
        $IdclienteSap:=fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:AccountIDs[com:Name = 'idClienteSAP']/com:ID)
        return
        <ns2:ACCTINFO>
            <ns2:AAC_ACCESS>{fn:data($IdclienteSap)}</ns2:AAC_ACCESS>
            <ns2:AAC_SERIAL_NUM>{fn:data($IdSalesForce)}</ns2:AAC_SERIAL_NUM>
            <ns2:AAC_SOURCE>SOA</ns2:AAC_SOURCE>
            <ns2:ACCESS_CODE1>{fn:data($claveCliente)}</ns2:ACCESS_CODE1>
            {
                if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:OracleId)
                then <ns2:ACCESS_CODE2>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:OracleId)}</ns2:ACCESS_CODE2>
                else ()
            }
            <ns2:ACCOUNT_NO>{fn:data($AccountNo)}</ns2:ACCOUNT_NO>
            <ns2:BAL_INFO elem="0"/>
            <ns2:BUSINESS_TYPE>2</ns2:BUSINESS_TYPE>
            <ns2:CURRENCY>{fn:data($CURRENCY)}</ns2:CURRENCY>
            <ns2:GL_SEGMENT>{fn:data(fn:concat('.',fn:lower-case($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:MarketSegmentCategory)))}</ns2:GL_SEGMENT>
            <ns2:POID>0.0.0.1 /account -1 0</ns2:POID>
        </ns2:ACCTINFO>
        }
        <ns2:BAL_INFO elem="0">
		<ns2:BILLINFO elem="0"/>
		<ns2:LIMIT elem="484">
			<ns2:CREDIT_FLOOR>-9999999999</ns2:CREDIT_FLOOR>
			<ns2:CREDIT_LIMIT>9999999999</ns2:CREDIT_LIMIT>
		</ns2:LIMIT>
                <ns2:NAME>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyBillingProfile[1]/cus:BillingProfileIdentifier/com:Name)}</ns2:NAME>
		<ns2:POID>0.0.0.1 /balance_group -1 0</ns2:POID>
	</ns2:BAL_INFO>
        <ns2:BILLINFO elem="0">
		<ns2:ACTG_FUTURE_DOM>1</ns2:ACTG_FUTURE_DOM>
		<ns2:BILLINFO_ID>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyBillingProfile[1]/cus:BillingProfileIdentifier/com:Name)}</ns2:BILLINFO_ID>
		<ns2:BILLING_STATUS>1</ns2:BILLING_STATUS>
		<ns2:BILL_WHEN>1</ns2:BILL_WHEN>
		<ns2:CURRENCY>{fn:data($CURRENCY)}</ns2:CURRENCY>
		<ns2:PARENT_BILLINFO_OBJ/>
		<ns2:PARENT_FLAGS>0</ns2:PARENT_FLAGS>
		<ns2:PAYINFO elem="0"/>
                <ns2:PAY_TYPE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyPaymentProfile/cus:PaymentMethodCode)}</ns2:PAY_TYPE>
		<ns2:POID>0.0.0.1 /billinfo -1 0</ns2:POID>
	</ns2:BILLINFO>
	<ns2:DESCR/>
	<ns2:FLAGS>1</ns2:FLAGS>
	<ns2:LOCALES elem="1">
		<ns2:LOCALE>es_MX</ns2:LOCALE>
	</ns2:LOCALES>
        {
        let
        $AccountName := fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:AccountIDs[1]/com:Name)
        return
        <ns2:NAMEINFO elem="1">
            <ns2:ADDRESS>{fn:data(fn:concat($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StreetName,'|',$Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StreetNumberLast,'|',$Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StreetNumberFirst,'|',$Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:SubUrbName))}</ns2:ADDRESS>
		<ns2:CITY>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:CityName)}</ns2:CITY>
                <ns2:COMPANY>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:Organization/com:TradingName)}</ns2:COMPANY>
            {
                if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:AddressID/com:Name)
                then <ns2:CONTACT_TYPE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:AddressID/com:Name)}</ns2:CONTACT_TYPE>
                else ()
            }
		<ns2:COUNTRY>{fn:data($COUNTRY)}</ns2:COUNTRY>
		<ns2:EMAIL_ADDR/>
		<ns2:FIRST_NAME>{fn:data($AccountName)}</ns2:FIRST_NAME>
		<ns2:LAST_NAME>{fn:data($AccountName)}</ns2:LAST_NAME>
		<ns2:SALUTATION/>
		<ns2:STATE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StateName)}</ns2:STATE>
		<ns2:TITLE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:Organization/com:FederalTaxId)}</ns2:TITLE>
		<ns2:ZIP>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:ZipCode)}</ns2:ZIP>
	</ns2:NAMEINFO>
        }
        <ns2:PAYINFO elem="0">
		<ns2:FLAGS>1</ns2:FLAGS>
		<ns2:INHERITED_INFO>
			<ns2:INV_INFO elem="0">
				<ns2:ADDRESS>{fn:data(fn:concat($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StreetName,'|',$Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StreetNumberLast,'|',$Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StreetNumberFirst,'|',$Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:SubUrbName))}</ns2:ADDRESS>
				<ns2:CITY>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:CityName)}</ns2:CITY>
				<ns2:COUNTRY>{fn:data($COUNTRY)}</ns2:COUNTRY>
				<ns2:DELIVERY_DESCR>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:Organization/com:TradingName)}</ns2:DELIVERY_DESCR>
				<ns2:DELIVERY_PREFER>0</ns2:DELIVERY_PREFER>
                                {
                                if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyContacts[1]/com:EmailAddress)
                                then <ns2:EMAIL_ADDR>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyContacts[1]/com:EmailAddress)}</ns2:EMAIL_ADDR>
                                else (
                                <ns2:EMAIL_ADDR/>
                                )
                                }
				<ns2:NAME>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:Organization/com:TradingName)}</ns2:NAME>
				<ns2:STATE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:StateName)}</ns2:STATE>
				<ns2:ZIP>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:ZipCode)}</ns2:ZIP>
			</ns2:INV_INFO>
		</ns2:INHERITED_INFO>
		<ns2:PAYMENT_TERM>1000</ns2:PAYMENT_TERM>
                <ns2:PAY_TYPE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyPaymentProfile/cus:PaymentMethodCode)}</ns2:PAY_TYPE>
		<ns2:POID>0.0.0.1 /payinfo/invoice -1 0</ns2:POID>
	</ns2:PAYINFO>
        <ns2:POID>0.0.0.1 /plan -1 0</ns2:POID>
        <ns2:PROFILES elem="0">
		<ns2:INHERITED_INFO>
			<ns2:BST_FLD_INE>
				<ns2:BST_FLD_INE_AMBIT/>
				<ns2:BST_FLD_INE_CODE/>
				<ns2:BST_FLD_INE_COMMITEE/>
				<ns2:BST_FLD_INE_ID_ACCOUNTING/>
				<ns2:BST_FLD_INE_PROCESS/>
			</ns2:BST_FLD_INE>
			<ns2:BST_FLD_PROFILE_ACCOUNT>
       {
           if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ID)
           then <ns2:BANK_ACCOUNT_NO>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ID)}</ns2:BANK_ACCOUNT_NO>
           else ()
       }
				<ns2:BST_FLD_ACCT_INTEREST_RATE>+0.5</ns2:BST_FLD_ACCT_INTEREST_RATE>
       {
           if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ClasificationCode)
           then <ns2:BST_FLD_BANK_CLABE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyPaymentProfile/cus:AgreementCompany/com:ClasificationCode)}</ns2:BST_FLD_BANK_CLABE>
           else ()
       }
				<ns2:BST_FLD_BUSINESS_SEGMENT>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyBillingProfile[1]/cus:InvoiceIndicator)}</ns2:BST_FLD_BUSINESS_SEGMENT>
				<ns2:BST_FLD_PAYMENT_MODE>1</ns2:BST_FLD_PAYMENT_MODE>
       {
           if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:SegmentoVtas)
           then <ns2:BST_FLD_SALES_SEGMENT>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:SegmentoVtas)}</ns2:BST_FLD_SALES_SEGMENT>
           else ()
       }
				<ns2:BST_FLD_TEXT_ACCOUNT/>
				<ns2:CURRENCY_RATE>1.000000</ns2:CURRENCY_RATE>
				<ns2:TEMPLATE>0</ns2:TEMPLATE>
				<ns2:USAGE_TYPE>G01</ns2:USAGE_TYPE>
				<ns2:BST_FLD_COMMENT_ACCOUNT/>
			</ns2:BST_FLD_PROFILE_ACCOUNT>
		</ns2:INHERITED_INFO>
		<ns2:PROFILE_OBJ>0.0.0.1 /profile/bestel/account -1 0</ns2:PROFILE_OBJ>
	</ns2:PROFILES>
        <ns2:PROFILES elem="1">
		<ns2:INHERITED_INFO>
			<ns2:DATA_ARRAY elem="1">
				<ns2:NAME>SEGMENT_ACCT</ns2:NAME>
				<ns2:VALUE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyBillingProfile[1]/cus:InvoiceIndicator)}</ns2:VALUE>
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
				<ns2:VALUE>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyLocations/com:CityName)}</ns2:VALUE>
				<ns2:VALID_FROM/>
				<ns2:VALID_TO/>
			</ns2:DATA_ARRAY>
			<ns2:DATA_ARRAY elem="4">
				<ns2:NAME>RETENCION</ns2:NAME>
				<ns2:VALUE>0</ns2:VALUE>
				<ns2:VALID_FROM/>
				<ns2:VALID_TO/>
			</ns2:DATA_ARRAY>
		</ns2:INHERITED_INFO>
		<ns2:PROFILE_OBJ>0.0.0.1 /profile/acct_extrating -1 0</ns2:PROFILE_OBJ>
	</ns2:PROFILES>
        <ns2:END_T>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:ServiceStartDate)}</ns2:END_T>
        {
            if ($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:ServiceStartDate)
            then <ns2:START_T>{fn:data($Input/ns1:DataArea/ns1:CreateCustomerParty/cus:CustomerPartyAccounts/cus:ServiceStartDate)}</ns2:START_T>
            else ()
        }
    </ns2:PCM_OP_CUST_COMMIT_CUSTOMER_inputFlist>
};

local:func($Input, $CURRENCY, $COUNTRY)