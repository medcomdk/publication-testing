// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Alias: $loinc = http://loinc.org
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $list-order = http://terminology.hl7.org/CodeSystem/list-order
Alias: $list-empty-reason = http://terminology.hl7.org/CodeSystem/list-empty-reason

Profile: MedComDocumentComposition
Parent: Composition
Id: medcom-document-composition
Description: "The profile of the MedCom Document Composition containing the minimum allowed content."
//* meta.language 0..1 MS
* meta.profile 1..1 MS
* confidentiality 1..1 MS
* text MS
* status = #final
* status MS
* type 1..1 MS
* subject 1.. MS
* subject only Reference(MedComDocumentPatient)
* subject ^type.aggregation = #bundled
* date 1..1 MS
* event 0..1 MS
* event.code 0..1 MS
* event.period.start 0..1 MS
* event.period.end 0..1 MS
* event.detail 0..* MS
* author ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this.resolve()"
  * ^slicing.rules = #closed
* author contains
    institution 1..1 MS and
    person 0..1 MS 
* author[institution] only Reference(MedComDocumentOrganization)
* author[institution] ^short = "The organization who authored the document"
* author[person] only Reference(MedComDocumentPractitioner)
* author[person] ^short = "The person who authored the document"
* author ^type.aggregation = #bundled
* attester 0..1 MS
* attester.party 0..1 MS
* attester.mode MS
* attester.party only Reference(MedComDocumentPractitioner)
* attester.party ^type.aggregation = #bundled
* title MS
* language 1..1 MS
* section 1.. MS
* section.text MS
* section.entry MS


/* Instance: CompositionExample
InstanceOf: MedComDocumentComposition
Usage: #example
// * identifier.system = "http://healthintersections.com.au/test" // ? -Establishes the namespace for the value - that is, a URL that describes a set values that are unique.
// * identifier.value = "1" // ? -The portion of the identifier typically relevant to the user and which is unique within the context of the system.
* meta.profile = "1.0"
* status = #final
* type = $loinc#11488-4 "Consult note"
// * category = $loinc#LP173421-1 "Report" 
* subject = Reference(69e475df-20c8-4f54-8cea-9843568205fd)
// * encounter = Reference(Encounter/xcda)
* date = "2012-01-04T09:10:14Z"
* author = Reference(Practitioner/xcda-author)
* title = "Example composition"
// * confidentiality = #N
// * attester.mode = #legal
// * attester.time = "2012-01-04T09:10:14Z"
// * attester.party = Reference(Practitioner/xcda-author) "Harold Hippocrates, MD"
// * custodian = Reference(Organization/2.16.840.1.113883.19.5) "Good Health Clinic"
// * relatesTo[0].code = #replaces
// * relatesTo[=].targetReference = Reference(Composition/old-example)
// * relatesTo[+].code = #appends
// * relatesTo[=].targetIdentifier.system = "http://example.org/fhir/NamingSystem/document-ids"
// * relatesTo[=].targetIdentifier.value = "ABC123"
// * event.code = $v3-ActCode#HEALTHREC "health record"
// * event.period.start = "2010-07-18"
// * event.period.end = "2012-11-12"
// * event.detail = Reference(Observation/example)
* section[0].title = "Deling af diagnoser"
* section[=].code = $loinc#11348-0 "History of past illness Narrative"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\t\t\t\t<table>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t<b>Code</b>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t<b>Date</b>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t<b>Type</b>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t<b>BodySite</b>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t<b>Severity</b>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>Stroke</td>\n\t\t\t\t\t\t<td>2010-07-18</td>\n\t\t\t\t\t\t<td>Diagnosis</td>\n\t\t\t\t\t\t<td/>\n\t\t\t\t\t\t<td/>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>Burnt Ear</td>\n\t\t\t\t\t\t<td>2012-05-24</td>\n\t\t\t\t\t\t<td>Diagnosis</td>\n\t\t\t\t\t\t<td>Left Ear</td>\n\t\t\t\t\t\t<td/>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td>Asthma</td>\n\t\t\t\t\t\t<td>2012-11-12</td>\n\t\t\t\t\t\t<td>Finding</td>\n\t\t\t\t\t\t<td/>\n\t\t\t\t\t\t<td>Mild</td>\n\t\t\t\t\t</tr>\n\t\t\t\t</table>\n\t\t\t</div>"
* section[=].mode = #snapshot
// * section[=].orderedBy = $list-order#event-date "Sorted by Event Date"
* section[=].entry[0] = Reference(Condition/stroke)
* section[=].entry[+] = Reference(Condition/example)
* section[=].entry[+] = Reference(Condition/example2)
/* * section[+].title = "History of family member diseases"
* section[=].code = $loinc#10157-6 "History of family member diseases Narrative"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\n\t\t\t\t<p>History of family member diseases - not available</p>\n\t\t\t</div>"
* section[=].mode = #snapshot
* section[=].emptyReason = $list-empty-reason#withheld "Information Withheld" */