table 50005 SvItemLedgerEntry
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Pile Ledger Entry', RUS = 'Книга операций свай';

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            CaptionML = ENU = 'Entry No.', RUS = 'Номер операции';
        }

        field(10; EntryType; Enum SvItemEntryType)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Entry Type', RUS = 'Тип операции';
        }

        field(20; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
            TableRelation = Project;
        }

        field(25; SvItemNo; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'SvItem No.', RUS = 'Тип cваи';
            TableRelation = SvItem;
        }

        field(30; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Document No.', RUS = 'Номер документа';
        }
        field(31; PostingDate; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Posting Date', RUS = 'Дата учета';

        }
        field(32; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Quantity', RUS = 'Количество';
        }
        field(33; RemainingQuantity; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Remaining Quantity', RUS = 'Остаток количество';
        }

        field(40; Open; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Open', RUS = 'Открыта';
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