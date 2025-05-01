// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: MedComDocumentBundle
Parent: Bundle
Id: medcom-document-bundle
Description: "The Bundle profile for a document"
* id 1..
* id MS
* identifier 1..1 MS
* type MS 
* type = #document
* type ^short = "Always a document"
* timestamp 1..1 MS 
* entry 1.. MS 
* entry.fullUrl 1..1 MS
* entry.resource 1.. MS

/* 
Instance: document
InstanceOf: MedComDocumentBundle
Usage: #example
* type = #document
* timestamp = 2024-05-01T12:00:00+01:00
* identifier.value = "7c596b9a-112e-4386-ae71-5ecdd3ed7c50"
* entry[+].fullUrl = "https://medcomfhir.dk/ig/carecommunication/MessageHeader/CompositionExample"
* entry[=].resource = CompositionExample
 */