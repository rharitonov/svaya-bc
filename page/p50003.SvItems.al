page 50003 SvItems
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = SvItem;
    CaptionML = ENU = 'SKU', RUS = 'Сваи';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}