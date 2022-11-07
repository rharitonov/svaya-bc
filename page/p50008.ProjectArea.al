page 50008 ProjectArea
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ProjectArea;
    CaptionML = ENU = 'Project Area', RUS = 'Структура проекта';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(AreaCode; Rec.AreaCode)
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