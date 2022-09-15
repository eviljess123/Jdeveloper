xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/GenericArrayResponce";
(:: import schema at "../../Schemas/GenericArrayResponce.xsd" ::)
declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare namespace res = "http://bst.izzi.mx/ws/responses";

declare namespace mod = "http://bst.izzi.mx/ws/responses/modelos";

declare namespace nan = "http://bst.izzi.mx/ws/responses/modelos/NaNetworkArea";

declare variable $Input as element() (:: schema-element(ns1:getASLResponse) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:getASLResponse) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        {
            for $naNetworkArea in $Input/res:buscarASLResponse/res:buscarASLByValuesResponseArray/mod:naNetworkArea
            return 
            <ns2:topLevelArray>
                <ns2:label>{fn:data($naNetworkArea/nan:name)}</ns2:label>
                <ns2:value>{fn:data($naNetworkArea/nan:aslID)}</ns2:value></ns2:topLevelArray>
        }
    </ns2:Root-Element>
};

local:func($Input)
