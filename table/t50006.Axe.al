table 50006 Axe
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Axe', RUS = 'Ось';

    fields
    {
        field(1; AxeName; Code[10])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Axe Name', RUS = 'Ось';

        }

        field(5; ProjectCode; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Code', RUS = 'Код проекта';
            TableRelation = Project;
        }

        field(10; AxeType; Enum AxeType)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Axe Type', RUS = 'Ориентация';
        }
    }

    keys
    {
        key(Key1; AxeName, ProjectCode)
        {
            Clustered = true;
        }
    }
}