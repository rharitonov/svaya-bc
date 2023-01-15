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

        field(19; Name; Text[1024])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Name', RUS = 'Наименование';
        }


        field(20; Address; Text[1024])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Address', RUS = 'Адрес';
        }

        field(21; StartingDate; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Starting Date', RUS = 'Дата начала';
        }

        field(22; EndingDate; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Ending Date', RUS = 'Дата окончания';
        }

        field(30; ProjectEngineer; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Engineer', RUS = 'Главный инженер';
            TableRelation = Employee;
        }

        field(31; ProjectProducer; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Project Producer', RUS = 'Ответственный за производство работ';
            TableRelation = Employee;
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