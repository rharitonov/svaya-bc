page 50010 ProjectDashboard
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Dashboard;
    Editable = false;
    SourceTableTemporary = true;
    PopulateAllFields = true;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                IndentationColumn = IndentVal;
                IndentationControls = Description;
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Job\ProjectStruct', RUS = 'Работа\Структура';
                }

                field(Completed; Rec.Completed)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                }
                field(Uncompleted; Rec.Uncompleted)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                }

                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                }

                field(Acted; Rec.Acted)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                }

                field(ActAccepted; Rec.ActAccepted)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                }

            }
        }
    }

    trigger OnOpenPage()
    var
        ProjectStructure: Record ProjectStructure;
        OrderKey: Integer;
    begin
        ProjectStructure.SetRange(ProjectCode, gProjectCodeFilter);

        Rec.Init();
        Rec.OrderKey := 1;
        Rec.ProjectCode := gProjectCodeFilter;
        Rec.JobType := Rec.JobType::QACertificatePosting;
        Rec.Description := Format(Rec.JobType);
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Description := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

        Rec.Init();
        Rec.OrderKey += 1;
        Rec.ProjectCode := gProjectCodeFilter;
        Rec.JobType := Rec.JobType::PileFieldAcceptance;
        Rec.Description := Format(Rec.JobType);
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Description := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

        Rec.Init();
        Rec.OrderKey += 1;
        Rec.ProjectCode := gProjectCodeFilter;
        Rec.JobType := Rec.JobType::PileAcceptance;
        Rec.Description := Format(Rec.JobType);
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Description := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

        Rec.Init();
        Rec.OrderKey += 1;
        Rec.ProjectCode := gProjectCodeFilter;
        Rec.JobType := Rec.JobType::PileWorks;
        Rec.Description := Format(Rec.JobType);
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Description := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.PorjectStructureCode <> '' then
            IndentVal := 3
        else
            IndentVal := 0;

        Rec.UpdateQuantities();
    end;

    var
        IndentVal: Integer;
        gProjectCodeFilter: Code[20];

    procedure SetProject(pNewPorjectCode: Code[20])
    begin
        gProjectCodeFilter := pNewPorjectCode;
    end;
}