xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/ServiceName";
(:: import schema at "../../Schemas/GetTelephoneNumberResponce.xsd" ::)
declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare namespace res = "http://bst.izzi.mx/ws/responses";

declare namespace mod = "http://bst.izzi.mx/ws/responses/modelos";

declare namespace tel = "http://bst.izzi.mx/ws/responses/modelos/TelephoneNumber";

declare variable $Input as element() (:: schema-element(ns1:getTelephoneNumberResponse) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:getTelephoneNumberResponse) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        {
            for $item in $Input/res:buscarTelephoneNumberResponse/res:telephoneNumberArray/mod:item
            return 
            <ns2:topLevelArray>
                <ns2:nbrInvID>{fn:data($item/tel:nbrInvID)}</ns2:nbrInvID>
                <ns2:nir>{fn:data($item/tel:nir)}</ns2:nir>
                <ns2:serie>{fn:data($item/tel:serie)}</ns2:serie>
                <ns2:linea>{fn:data($item/tel:linea)}</ns2:linea>
                <ns2:sufix>{fn:data($item/tel:sufix)}</ns2:sufix>
                <ns2:identText>{fn:data($item/tel:identText)}</ns2:identText>
                <ns2:formattedIdentText>{fn:data($item/tel:formattedIdentText)}</ns2:formattedIdentText>
                <ns2:telNbrTypeCD>{fn:data($item/tel:telNbrTypeCD)}</ns2:telNbrTypeCD>
                <ns2:tniCategoryDesc>{fn:data($item/tel:tniCategoryDesc)}</ns2:tniCategoryDesc>
                <ns2:tniSubcategoryDesc>{fn:data($item/tel:tniSubcategoryDesc)}</ns2:tniSubcategoryDesc>
                <ns2:sfStrucFormatNm>{fn:data($item/tel:sfStrucFormatNm)}</ns2:sfStrucFormatNm>
                </ns2:topLevelArray>
        }
    </ns2:Root-Element>
};

local:func($Input)
