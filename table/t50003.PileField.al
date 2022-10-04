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
        field(5; PileType; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Type', RUS = 'Тип сваи';
            TableRelation = SvItem;
        }
        field(10; PileNumberFrom; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Number From', RUS = 'Номер сваи от..';
        }

        field(20; PileNumberTo; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Pile Number To', RUS = 'Номер сваи по..';
        }

    }

    keys
    {
        key(Key1; ProjectCode, PileType)
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