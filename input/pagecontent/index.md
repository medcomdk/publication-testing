# DK MedCom Document

This Implementation Guide (IG) is provided by MedCom to describe the use of FHIR ®© in document based exchange of data in Danish healthcare.

The IG contains profiles which are used to define a general model for FHIR documents. The use case specific profiles, such as [ConditionList](http://medcomfhir.dk/ig/conditionlist), are maintained in an individuel IG.

The profiles builds upon the knowledge obtained through the use of CDA in Denmark and the work around [FHIR documents from HL7 International](https://hl7.org/fhir/R4/documents.html).

#### General Document Model

The figure below illustrates a general document model, which all MedCom document will comply to. Document profiles are all prefixed "MedComDocument". Beside the profiles on the figure, a MedCom document will also include some MedComCore profiles and profiles made to support a specific use case. All together they constitute the actual content of a MedCom document. The following sections describe the overall purpose of each document profile.

<img alt="Shows the general MedCom document model. Each document must at least contain the following resources: Bundle, Composition, Organization, Patient and use case specific resources." src="./DocumentModel.svg" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

##### MedComDocumentBundle

[MedComDocumentBundle](./StructureDefinition-medcom-document-bundle.html) is a Bundle resource defined to be of the type 'document'. All profiles included in a message shall be referenced from the entry element in the profile, with a Composition as the first resource. 

__Note:__ Be aware that entries in a document in general are unordered.

##### MedComDocumentCompostition

When the Bundle is of the type 'document', the [MedComDocumentCompostition](./StructureDefinition-medcom-document-composition.html) resource must be the first resource. The resource creates the structure for the document and references the relevant clinical information.

##### MedComDocumentOrganization

The [MedComDocumentOrganization](./StructureDefinition-medcom-document-organization.html) profile inherits from MedComCoreOrganization and is used to describe author organization. The resource constrains the MedComCoreOrganization profile to contain a SOR identifier and a name.

##### MedComDocumentPatient

The [MedComDocumentPatient](./StructureDefinition-medcom-document-patient.html) profile desribes the basic requirements for information about citizens and patients when exhancging a document. The profile inherits from DkCorePatient and furhter limit the requirements, e.g. may documents only be exchanged for patients with a CPR-number. To limit the MustSupport elements, this profiles does not inherit from MedComCorePatient.

##### MedComDocumentPractitioner

The [MedComDocumentPractitioner](./StructureDefinition-medcom-document-practitioner.html) profile inherits from MedComCorePractitioner and further requires a given and family name to be present. 

##### MedComDocumentReference

The [MedComDocumentReference](./StructureDefinition-medcom-documentreference.html) profile should not be exchanged, but can be used for internal validation of the metadata associated with a document, as the DocumentReference contains the same information as the IHE XDS metadata standard. 

#### General document assumptions

**Bundle.identifier:** Once a document is assembled into a Bundle, the document is immutable, meaning its content cannot be changed, and the document id (Bundle.identifier) can never be reused. 

**XML and JSON:** Note that the document may be represented in either XML or JSON and interconverted between these or have its character encoding changed, all the while remaining the same document. 

**Narrative:** It is a key element in documents that they contain a narrative text. The requirements concerning the narrative text, follows the [recommendations from HL7 for narrative text](https://hl7.org/fhir/R4/documents.html#presentation). This states that there must be narrative text included in the subject resource, which is the Patient resource in this IG, the Composition resource and for each Composition.section.text.

#### Terminology
On [MedCom Terminology IG](http://medcomfhir.dk/ig/terminology/) all referenced CodeSystem and ValueSets developed by MedCom can be found.

#### Dependencies
This IG has a dependency to the [MedComCore IG](http://medcomfhir.dk/ig/core/) and [DK-core](https://hl7.dk/fhir/core/) v. 3.2.0, defined by [HL7 Denmark](https://hl7.dk/). 

### Documentation

[More information about MedCom Document](https://medcomdk.github.io/dk-medcom-document/) can be found here. MedCom document profiles does not alone constitute a standard, why the documentation is limited.

### Governance

FHIR profiles are managed under MedCom: [Source code](https://github.com/medcomdk/dk-medcom-document). 

#### Quality Assurance Report

In the Quality Assurance report (QA-report) for this IG, there is an error with the following description: *Reference is remote which isn’t supported by the specified aggregation mode(s) for the reference (bundled)*. The error occurs when creating instances of the profiles and is due to some elements having a Bundled flag {b}, however the referenced profile is not included in a Bundle in an instance, since the instance only represents a part of the entire message. This should not influence the implementation by IT-vendors.

### Contact

[MedCom](https://www.medcom.dk/) is responsible for this IG.

If you have any questions, please contact <fhir@medcom.dk> or write to MedCom's stream in [Zulip](https://chat.fhir.org/#narrow/stream/315677-denmark.2Fmedcom.2FFHIRimplementationErfaGroup).


