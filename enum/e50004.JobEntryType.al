enum 50004 JobEntryType
{
    Extensible = true;

    value(0; " ") { }
    value(2; QACertificatePosting) { CaptionML = ENU = 'Pile Certificate Posting', RUS = 'Паспорта качества'; }
    value(3; PileFieldAcceptance) { CaptionML = ENU = 'Pile Field Acceptance', RUS = 'Осв. отв. конструкций'; }
    value(4; PileAcceptance) { CaptionML = ENU = 'Pile Acceptance', RUS = 'Осв. скр. работ'; }
    value(5; PileWorks) { CaptionML = ENU = 'Pile Works', RUS = 'Осв. скр. работ - погружение'; }
}