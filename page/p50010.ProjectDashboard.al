page 50010 ProjectDashboard
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Dashboard;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec.Description)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Job\ProjectStruct', RUS = 'Работа\Структура';
                }

                field(Completed; Rec.Completed)
                {
                    ApplicationArea = All;
                }
                field(Uncompleted; Rec.Uncompleted)
                {
                    ApplicationArea = All;
                }

                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                }

                field(Acted; Rec.Acted)
                {
                    ApplicationArea = All;
                }

                field(ActAccepted; Rec.ActAccepted)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnOpenPage()
    var
        ProjectCodeFilter: Text;
        ProjectStructure: Record ProjectStructure;
        OrderKey: Integer;
    begin
        ProjectCodeFilter := Rec.GetFilter(ProjectCode);
        ProjectStructure.SetRange(ProjectCode, ProjectCodeFilter);

        Rec.Init();
        Rec.OrderKey := 1;
        Rec.ProjectCode := ProjectCodeFilter;
        Rec.JobType := Rec.JobType::QACertificatePosting;
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

        Rec.Init();
        Rec.OrderKey += 1;
        Rec.ProjectCode := ProjectCodeFilter;
        Rec.JobType := Rec.JobType::PileFieldAcceptance;
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

        Rec.Init();
        Rec.OrderKey += 1;
        Rec.ProjectCode := ProjectCodeFilter;
        Rec.JobType := Rec.JobType::PileAcceptance;
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

        Rec.Init();
        Rec.OrderKey += 1;
        Rec.ProjectCode := ProjectCodeFilter;
        Rec.JobType := Rec.JobType::PileWorks;
        Rec.Insert(true);
        if ProjectStructure.FindSet() then
            repeat
                Rec.OrderKey += 1;
                Rec.PorjectStructureCode := ProjectStructure.StructureCode;
                Rec.Insert(true);
            until ProjectStructure.Next() = 0;

    end;

}