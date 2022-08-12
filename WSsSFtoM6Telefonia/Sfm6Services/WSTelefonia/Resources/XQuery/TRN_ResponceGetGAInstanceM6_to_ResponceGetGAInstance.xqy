xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/getGAInstance";
(:: import schema at "../../Schemas/ResponceGetGAInstance.xsd" ::)
declare namespace ns1="http://bst.izzi.mx/ws";
(:: import schema at "../../Schemas/XMLSchema_-1338642948.xsd" ::)

declare namespace res = "http://bst.izzi.mx/ws/responses";

declare namespace mod = "http://modelos.sql.mx";

declare namespace gai = "http://bst.izzi.mx/ws/responses/modelos/GAInstance";

declare variable $Input as element() (:: schema-element(ns1:getGAInstanceResponse) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:getGAInstanceResponse) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        {
            for $gaInstance in $Input/return/res:buscarGAInstanceByIdResponseArray/mod:gaInstance
            return 
            <ns2:topLevelArray>
                <ns2:label>{fn:data($gaInstance/gai:gaInstanceID)}</ns2:label>
                <ns2:value>{fn:data($gaInstance/gai:instanceValue)}</ns2:value></ns2:topLevelArray>
        }
    </ns2:Root-Element>
};

local:func($Input)
