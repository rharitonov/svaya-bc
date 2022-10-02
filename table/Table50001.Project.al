table 50001 Project
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Project', RUS = 'Проект';

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Code', RUS = 'Код';

        }

        field(10; ConstructionObject; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Constuction Object', RUS = 'Объект строительства';
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