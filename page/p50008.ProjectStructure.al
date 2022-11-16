page 50008 ProjectStructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ProjectStructure;
    CaptionML = ENU = 'Project Area', RUS = 'Структура проекта';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(AreaCode; Rec.StructureCode)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }

            }
        }
    }
}