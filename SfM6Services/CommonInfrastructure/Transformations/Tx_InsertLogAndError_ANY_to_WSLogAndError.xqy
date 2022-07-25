xquery version "2004-draft";
(:: pragma  parameter="$message" type="anyType" ::)
(:: pragma bea:global-element-return element="ns1:LogMessage" location="../../CommonDataModel/Schemas/CDMCommon.xsd" ::)

declare namespace ns1 = "http://telum.mx/CommonDataModel/2.0/Common";
declare namespace ns0 = "http://telum.mx/";
declare namespace xf = "http://tempuri.org/CommonInfrastructure/Transformations/InsertLogAndError_ANY_to_WSLogAndError/";
declare namespace functx = "http://www.functx.com";

declare function xf:InsertLogAndError_ANY_to_WSLogAndError($logTypeId as xsd:normalizedString,
    $businessMessageId as xs:string,
    $messageIdentifier as xsd:normalizedString,    
    $processId as xsd:normalizedString,
    $task as xs:string,
    $information as xsd:normalizedString,
    $message as element(*))
    as element(ns1:LogMessage) {
        <ns1:LogMessage>
            <ns1:logTypeId>{ validationTypeLogs($logTypeId) }</ns1:logTypeId>
            <ns1:businessMessageId>{ $businessMessageId }</ns1:businessMessageId>
            <ns1:messageIdentifier>{ $messageIdentifier }</ns1:messageIdentifier>            
            <ns1:processId>{ $processId }</ns1:processId>
            <ns1:task>{ $task }</ns1:task>            
            <ns1:information>{ $information }</ns1:information>
            <ns1:message>{ fn-bea:serialize($message) }</ns1:message>
        </ns1:LogMessage>
};

declare function validationTypeLogs( $logType as xs:string)  as xs:integer {
  if(functx:is-a-number($logType)) then
      xs:integer($logType)
  else
      typeLogs($logType)

 };

declare function typeLogs( $logType as xs:string)  as xs:integer {
    (:  ****Tipos de Log****
    1=ERROR
    2=WARN
    3=INFO
    4=DEBUG
    :)

  if($logType = 'ERROR') then
      1
  else if($logType = 'WARN') then
      2
  else if($logType = 'INFO') then
      3
  else if($logType = 'DEBUG') then  
      4
  else
      1 (: Default error :)

 };

declare function functx:is-a-number
  ( $value as xs:string )  as xs:boolean {

   string(number($value)) != 'NaN'
 } ;


declare variable $logTypeId as xsd:normalizedString external;
declare variable $businessMessageId as xs:string external;
declare variable $messageIdentifier as xsd:normalizedString external;
declare variable $processId as xsd:normalizedString external;
declare variable $task as xs:string external;
declare variable $information as xsd:normalizedString external;
declare variable $message as element(*) external;

xf:InsertLogAndError_ANY_to_WSLogAndError($logTypeId,
    $businessMessageId,
    $messageIdentifier,
    $processId,
    $task,
    $information,
    $message)