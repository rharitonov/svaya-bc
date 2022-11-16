table 50007 ProjectStructure
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Project Structure', RUS = 'Структура проекта';

    fields
    {
        field(1; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
            TableRelation = Project;
        }

        field(10; StructureCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Structure Code', RUS = 'Код структуры';
        }

        field(20; Description; Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Description', RUS = 'Описание';
        }
    }

    keys
    {
        key(Key1; ProjectCode, StructureCode)
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