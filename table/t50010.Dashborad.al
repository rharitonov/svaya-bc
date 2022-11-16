table 50010 Dashboard
{
    DataClassification = ToBeClassified;
    TableType = Temporary;
    CaptionML = ENU = 'Dashboard', RUS = 'Сводка';


    fields
    {
        field(1; OrderKey; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'OrderKey', RUS = 'Сортировка';
        }

        field(2; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
        }

        field(3; PorjectStructureCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Structure Code', RUS = 'Код стадии проекта';
        }
        field(4; JobType; Enum JobEntryType)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Job Type', RUS = 'Вид работы';
        }

        field(5; Description; Text[1024])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Jobs/Stages', RUS = 'Работы/Стадии';
        }


        field(10; Completed; Integer)
        {
            //FieldClass = FlowField;
            //CalcFormula = count(JobLedgerEntry where(ProjectCode = field(ProjectCode), ProjectStructureCode = field(PorjectStructureCode), EntryType = field(JobType)));
            CaptionML = ENU = 'Completed', RUS = 'Выполнено';
        }

        field(11; Uncompleted; Integer)
        {
            CaptionML = ENU = 'Uncompleted', RUS = 'Невыполнено';
        }
        field(12; Total; Integer)
        {
            CaptionML = ENU = 'Total', RUS = 'Всего';
        }

        field(13; Acted; Integer)
        {
            CaptionML = ENU = 'Acted', RUS = 'В актах к подписанию';
        }

        field(14; ActAccepted; Integer)
        {
            CaptionML = ENU = 'ActAccepted', RUS = 'Принято по актам';
        }

    }

    keys
    {
        key(Key1; OrderKey)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Rec.Completed := Rec.GetJobCompleteQuantity();
        Rec.Total := Rec.GetTotalQuantity();
        Rec.Uncompleted := Rec.Total - Rec.Completed;
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

    procedure GetJobCompleteQuantity() Result: Integer
    var
        JobLedgerEntry: Record JobLedgerEntry;
    begin
        JobLedgerEntry.SetRange(ProjectCode, Rec.ProjectCode);
        if Rec.PorjectStructureCode <> '' then
            JobLedgerEntry.SetRange(ProjectStructureCode, Rec.PorjectStructureCode);
        JobLedgerEntry.SetRange(EntryType, Rec.JobType);
        Result := JobLedgerEntry.Count();
    end;

    procedure GetTotalQuantity() Result: Integer
    var
        PileField: Record PileField;
    begin
        PileField.SetRange(ProjectCode, Rec.ProjectCode);
        if Rec.PorjectStructureCode <> '' then
            PileField.SetRange(ProjectStructureCode, Rec.PorjectStructureCode);
        Result := PileField.Count();
    end;

}

