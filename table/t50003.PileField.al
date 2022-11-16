table 50003 PileField
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Pile Field', RUS = 'Свайное поле';

    fields
    {
        field(1; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
            TableRelation = Project;
        }
        field(2; ProjectStructureCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Structure Code', RUS = 'Код структуры проекта';
            TableRelation = ProjectStructure.StructureCode where(ProjectCode = field(ProjectCode));
        }

        field(3; PileFieldPositionNo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Field Postion No.', RUS = 'Номер сваи';
        }
        field(10; PileType; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Type', RUS = 'Тип сваи';
            TableRelation = SvItem;
        }

    }

    keys
    {
        key(Key1; ProjectCode, PileFieldPositionNo)
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