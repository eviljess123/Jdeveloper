xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/SfDueDate_duedate_request";
(:: import schema at "../../XSD/RequestSfDueDateXSD.xsd" ::)
declare namespace ns2="http://bst.izzi.mx/ws";
(:: import schema at "../../XSD/XMLSchema_-1967821732.xsd" ::)

declare variable $Input as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($Input as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:completarDueDateRequest) ::) {
    <ns2:completarDueDateRequest>
        <numeroPSR>{fn:data($Input/ns1:nbrPSR)}</numeroPSR>
        <billActivationDate>{fn:data($Input/ns1:BAD)}</billActivationDate>
    </ns2:completarDueDateRequest>
};

local:func($Input)
