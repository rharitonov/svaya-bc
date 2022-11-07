table 50002 SvItem
{
    DataClassification = ToBeClassified;
    LookupPageId = SvItems;
    DrillDownPageId = SvItems;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'No.', RUS = 'Номер';

        }
        field(10; Description; Text[512])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Description', RUS = 'Описание';
        }

        field(20; "Description 2"; Text[512])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Description 2', RUS = 'Описание 2';
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}