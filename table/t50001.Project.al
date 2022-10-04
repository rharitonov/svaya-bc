table 50001 Project
{
    DataClassification = ToBeClassified;
    CaptionML = ENU = 'Project', RUS = 'Проект';
    LookupPageId = Projects;
    DrillDownPageId = Projects;

    fields
    {
        field(1; "ProjectCode"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Code', RUS = 'Код';

        }

        field(10; ConstructionObject; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Constuction Object', RUS = 'Объект строительства';
            TableRelation = ConstructionObject;
        }

        field(20; Address; Text[1024])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Address', RUS = 'Адрес';
        }
    }

    keys
    {
        key(Key1; "ProjectCode")
        {
            Clustered = true;
        }
    }

}