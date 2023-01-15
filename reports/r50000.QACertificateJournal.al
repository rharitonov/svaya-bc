report 50000 QACertificateJournal
{
    DefaultLayout = RDLC;
    RDLCLayout = 'reports\QACertificateJournal.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    CaptionML = ENU = 'QACertificateJournal', RUS = 'Журнал входного контроля';


    dataset
    {
        dataitem(JobJnlLineArchive; JobJournalLineArchive)
        {
            DataItemTableView = where(EntryType = filter(QACertificatePosting));
            column(CompanyName_Txt; CompanyInfo.Name) { }
            column(DocumentMainTitle_Caption; StrSubstNo('ЖУРНАЛ № %1', JournalPrintNo)) { }


            column(ObjectName_Txt; Project.Name) { }
            column(ObjectAddress_Txt; Project.Address) { }

            column(JobStartingDate_Txt; Format(StartginDate)) { }
            column(JobEndginDate_Txt; Format(EndingDate)) { }
            column(ProjectEngineer_Txt; ProjectEngineerFullname) { }
            column(ProjectProducer_Txt; ProjectProducerFullname) { }


            column(Header_Col1_Caption; '№ п/п') { }
            column(Header_Col2_Caption; 'Дата поступления') { }
            column(Header_Col3_Caption; 'Наименование материлов и конструкций') { }
            column(Header_Col4_Caption; 'Количество') { }
            column(Header_Col5_Caption; 'Поставщик') { }
            column(Header_Col6_Caption; 'Наименование сопроводительного документа, №№ накладых') { }
            column(Header_Col7_Caption; 'Отклонение от ГОСТа, СНиПа, ТУ, ВСН дефекты') { }
            column(Header_Col8_Caption; 'Подпись лица, осуществляющего контроль') { }
            column(Header_Col9_Caption; 'Примечание') { }

            column(Header_NCol1_Caption; '1') { }
            column(Header_NCol2_Caption; '2') { }
            column(Header_NCol3_Caption; '3') { }
            column(Header_NCol4_Caption; '4') { }
            column(Header_NCol5_Caption; '5') { }
            column(Header_NCol6_Caption; '6') { }
            column(Header_NCol7_Caption; '7') { }
            column(Header_NCol8_Caption; '8') { }
            column(Header_NCol9_Caption; '9') { }


            column(Col1_Txt; Format(RowNo)) { }
            column(Col2_Txt; Format(JobJnlLineArchive.PostingDate)) { }
            column(Col3_Txt; SvItem.Description) { }
            column(Col4_Txt; JobJnlLineArchive.Quantity) { }
            column(Col5_Txt; Vendor.Name) { }
            column(Col6_Txt; StrSubstNo('%1 %2', JobJnlLineArchive.PileQACertificateNo, JobJnlLineArchive.PileQACertificateIssueDate)) { }
            column(Col7_Txt; 'нет') { }

            //column(Col8_Txt; ) { }
            //column(Col9_Txt; ) { }



            trigger OnAfterGetRecord()
            begin
                CompanyInfo.get();
                JournalPrintNo := 1;
                RowNo += 1;

                if not SvItem.Get(JobJnlLineArchive.SvItemNo) then
                    SvItem.Init();

                Vendor.Get(JobJnlLineArchive.ManufacturerNo);

                if Project.ProjectCode = '' then begin
                    Project.Get(JobJnlLineArchive.ProjectCode);
                    if Employee.Get(Project.ProjectEngineer) then
                        ProjectEngineerFullName := Employee."Last Name" + ' ' + Employee."First Name" + ' ' + Employee."Middle Name";
                    if Employee.Get(Project.ProjectProducer) then
                        ProjectProducerFullName := Employee."Last Name" + ' ' + Employee."First Name" + ' ' + Employee."Middle Name"
                end;

                if StartginDate = 0D then begin
                    StartginDate := JobJnlLineArchive.PostingDate;
                    EndingDate := JobJnlLineArchive.PostingDate;
                end else begin
                    if JobJnlLineArchive.PostingDate < StartginDate then
                        StartginDate := JobJnlLineArchive.PostingDate;
                    if JobJnlLineArchive.PostingDate > EndingDate then
                        EndingDate := JobJnlLineArchive.PostingDate;
                end;
            end;
        }

    }

    labels
    {
        SubTitleCaption = 'ВХОДНОГО КОНТРОЛЯ И УЧЕТА КАЧЕСТВА ПОЛУЧАЕМЫХ ДЕТАЛЕЙ, МАТЕРИАЛОВ, КОНСТРУКЦИЙ И ОБОРУДОВАНИЯ';
        ObjectNameCaption = 'Наименование объекта';
        ObjectAddressCaption = 'Адрес объекта';
        StartingDaterCaption = 'Начало работ';
        EndingDaterCaption = 'Завершение работ';
        ProjectEngineerCaption = 'Главный инженер';
        ProjectProducerCaption = 'Ответственный за производство работ';

    }

    trigger OnPreReport()
    begin

        Project.ProjectCode := '';
    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        SvItem: Record SvItem;
        Vendor: Record Vendor;
        Employee: Record Employee;
        Project: Record Project;
        JournalPrintNo, RowNo : Integer;

        ProjectEngineerFullName, ProjectProducerFullName : Text[200];
        StartginDate, EndingDate : Date;

    /*
    SubTitleCaption: Label 'ВХОДНОГО КОНТРОЛЯ И УЧЕТА КАЧЕСТВА ПОЛУЧАЕМЫХ ДЕТАЛЕЙ, МАТЕРИАЛОВ, КОНСТРУКЦИЙ И ОБОРУДОВАНИЯ';
    ObjectNameCaption: Label 'Наименование объекта';
    ObjectAddressCaption: Label 'Адрес объекта';
    StartingDaterCaption: Label 'Начало работ';
    EndingDaterCaption: Label 'Завершение работ';

    ProjectEngineerCaption: Label 'Главный инженер';
    ProjectProducerCaption: Label 'Ответственный за производство работ';
    */

}