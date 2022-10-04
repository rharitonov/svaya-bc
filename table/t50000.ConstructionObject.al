table 50000 ConstructionObject
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Construction Object', RUS = 'Объект Строительства';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Code', RUS = 'Код';
        }

        field(10; "Type"; Enum ConstructionObject)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Type', RUS = 'Тип';
        }

        field(20; Address; Text[2048])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Address', RUS = 'Адрес';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

}