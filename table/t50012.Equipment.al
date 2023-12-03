table 50012 Equipment
{
    DataClassification = ToBeClassified;
    LookupPageId = EquipmentList;
    DrillDownPageId = EquipmentList;
    CaptionML = RUS = 'Техника';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = RUS = 'Код';

        }

        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            CaptionML = RUS = 'Описание';

        }

        field(10; HammerType; Text[50])
        {
            DataClassification = ToBeClassified;
            CaptionML = RUS = 'Тип молота';

        }

        field(11; HammerWeightT; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = RUS = 'Вес ударной части молота (Т)';
            BlankZero = true;

        }

        field(12; HammerImpactEnergykJ; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = RUS = 'Энергия удара молота (кДж)';
            BlankZero = true;
        }


    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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