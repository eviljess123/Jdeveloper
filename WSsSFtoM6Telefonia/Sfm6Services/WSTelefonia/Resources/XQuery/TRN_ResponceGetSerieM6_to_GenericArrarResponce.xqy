xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/GenericArrayResponce";
(:: import schema at "../../Schemas/GenericArrayResponce.xsd" ::)
declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare namespace res = "http://bst.izzi.mx/ws/responses";

declare namespace mod = "http://bst.izzi.mx/ws/responses/modelos";

declare namespace res1 = "http://bst.sql.mx/ws/responses";

declare namespace ser = "http://bst.izzi.mx/ws/responses/modelos/Serie";

declare variable $Input as element() (:: schema-element(ns1:getSerieResponse) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:getSerieResponse) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        {
            for $serie in $Input/res:buscarSeriesResponse/res1:buscarSeriesByValuesResponseArray/mod:serie
            return 
            <ns2:topLevelArray>
                <ns2:label>{fn:data($serie/ser:serie)}</ns2:label>
                <ns2:value>{fn:data($serie/ser:serie)}</ns2:value></ns2:topLevelArray>
        }
    </ns2:Root-Element>
};

local:func($Input)
