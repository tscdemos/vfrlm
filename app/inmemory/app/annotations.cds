using { bookshopSrv } from '../srv/service.cds';

annotate bookshopSrv.Book with @odata.draft.enabled;
annotate bookshopSrv.Author with @odata.draft.enabled;
annotate bookshopSrv.Author with @cds.odata.valuelist;
annotate bookshopSrv.Book with @cds.odata.valuelist;
annotate bookshopSrv.Book with @UI.HeaderInfo: { TypeName: 'Book', TypeNamePlural: 'Books', Title: { Value: title } };
annotate bookshopSrv.Book with {
  ID @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly }
};
annotate bookshopSrv.Book with @UI.Identification: [{ Value: title }];
annotate bookshopSrv.Book with {
  title @title: 'Title';
  pageCount @title: 'Page Count'
};

annotate bookshopSrv.Book with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: pageCount },
    { $Type: 'UI.DataField', Label: 'Author', Value: author_ID }
];

annotate bookshopSrv.Book with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: pageCount },
    { $Type: 'UI.DataField', Label: 'Author', Value: author_ID }
  ]
};

annotate bookshopSrv.Book with {
  author @Common.Text: { $value: author.lastName, ![@UI.TextArrangement]: #TextOnly }
};

annotate bookshopSrv.Book with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Page', Target : 'pages/@UI.LineItem' }
];

annotate bookshopSrv.Author with @UI.HeaderInfo: { TypeName: 'Author', TypeNamePlural: 'Authors', Title: { Value: lastName } };
annotate bookshopSrv.Author with {
  ID @Common.Text: { $value: lastName, ![@UI.TextArrangement]: #TextOnly }
};
annotate bookshopSrv.Author with @UI.Identification: [{ Value: lastName }];
annotate bookshopSrv.Author with {
  firstName @title: 'First Name';
  lastName @title: 'Last Name';
  birthDate @title: 'Birth Date'
};

annotate bookshopSrv.Author with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: birthDate }
];

annotate bookshopSrv.Author with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: birthDate }
  ]
};

annotate bookshopSrv.Author with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate bookshopSrv.Page with @UI.HeaderInfo: { TypeName: 'Page', TypeNamePlural: 'Pages', Title: { Value: wordCount } };
annotate bookshopSrv.Page with {
  ID @Common.Text: { $value: wordCount, ![@UI.TextArrangement]: #TextOnly }
};
annotate bookshopSrv.Page with @UI.Identification: [{ Value: wordCount }];
annotate bookshopSrv.Page with {
  wordCount @title: 'Word Count'
};

annotate bookshopSrv.Page with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: wordCount }
];

annotate bookshopSrv.Page with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: wordCount }
  ]
};

annotate bookshopSrv.Page with {
  book @Common.Text: { $value: book.title, ![@UI.TextArrangement]: #TextOnly }
};

annotate bookshopSrv.Page with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

