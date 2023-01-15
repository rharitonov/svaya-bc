table 50004 PileFieldBuffer
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';

        }

        field(2; ProjectStructureCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Structure Code', RUS = 'Код структуры проекта';
            TableRelation = ProjectStructure.StructureCode where(ProjectCode = field(ProjectCode));

        }

        field(3; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Line No.', RUS = 'Строка Но';

        }

        field(10; PileType; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Type', RUS = 'Тип сваи';
            TableRelation = SvItem;

        }

        field(20; PileFieldPositionFrom; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Field Position From', RUS = 'Номер сваи с';

        }

        field(30; PileFieldPositionTo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Field Position To', RUS = 'Номер сваи по';

        }

    }

    keys
    {
        key(Key1; ProjectCode, ProjectStructureCode, LineNo)
        {
            Clustered = true;
        }

        key(key2; PileFieldPositionFrom)
        {

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