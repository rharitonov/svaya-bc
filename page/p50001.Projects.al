page 50001 Projects
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Project;
    CaptionML = ENU = 'Projects', RUS = 'Проекты';
    CardPageId = Project;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ProjectCode; Rec."ProjectCode")
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreatePileField)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Create Pile Field', RUS = 'Создать Свайное Поле';

                trigger OnAction();
                begin

                end;
            }
        }
    }
}