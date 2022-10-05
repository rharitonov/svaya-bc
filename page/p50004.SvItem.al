page 50004 SvItemCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SvItem;
    CaptionML = ENU = 'Sv Item Card', RUS = 'Карточка сваи';


    layout
    {
        area(Content)
        {
            group(General)
            {
                CaptionML = ENU = 'General', RUS = 'Общее';
                field(Name; Rec."No.")
                {
                    ApplicationArea = All;

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = all;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}