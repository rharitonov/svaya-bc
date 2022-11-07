table 50007 ProjectArea
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Project Area', RUS = 'Структура';

    fields
    {
        field(1; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
            TableRelation = Project;
        }

        field(10; AreaCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Area Code', RUS = 'Код структуры';
        }

        field(20; Description; Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Description', RUS = 'Описание';
        }
    }

    keys
    {
        key(Key1; ProjectCode, AreaCode)
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