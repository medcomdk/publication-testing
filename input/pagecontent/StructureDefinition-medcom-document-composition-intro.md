### Scope and usage 

The MedComDocumentComposition profile defines the structure and narrative content necessary for a document. However, a Composition alone does not constitute a document. Rather, the Composition must be the first entry in a Bundle where Bundle.type=document, and any other resources referenced from Composition must be included as subsequent entries in the Bundle. The Composition resource organizes clinical and administrative content into sections, each of which contains a narrative, and references other resources for supporting data.
