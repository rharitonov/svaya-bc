table 50011 JobJournalLineArchive
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'JobJournalLineArchive', RUS = 'Журнал работ (Архив)';

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Entry No.', RUS = 'Номер операции';

        }

        field(2; EntryType; Enum JobEntryType)
        {

            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Entry Type', RUS = 'Тип строки';
        }

        field(10; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
            TableRelation = Project;
        }

        field(11; ProjectStructureCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Structure Code', RUS = 'Код структуры проекта';
            TableRelation = ProjectStructure.StructureCode where(ProjectCode = field(ProjectCode));
        }

        field(20; PileQACertificateNo; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile QA Cert. No.', RUS = 'Номер паспорта';

        }

        field(21; PileQACertificateIssueDate; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile QA Cert. Issue Date', RUS = 'Дата паспорта';
        }
        field(22; ManufacturerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Manufacturer No.', RUS = 'Производитель';
            TableRelation = Vendor;
        }
        field(23; PostingDate; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Posting Date', RUS = 'Дата учета';
        }

        field(30; SvItemNo; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Item No.', RUS = 'Марка сваи';
            TableRelation = SvItem;
        }

        field(31; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Qunatity', RUS = 'Количество';
        }

        field(33; PileFieldPositionNo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = ' Pile Field Postition No.', RUS = 'Номер свайного основания';
        }

        field(34; PileFieldPositionFrom; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = ' Pile Field Postition From', RUS = 'C номера свайного основания';
        }

        field(35; PileFieldPositionTo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = ' Pile Field Postition To', RUS = 'По номер свайного основания';
        }

    }

    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}