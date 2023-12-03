page 50012 EquipmentList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    DelayedInsert = true;
    SourceTable = Equipment;
    CaptionML = RUS = 'Техника';


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(HammerType; Rec.HammerType)
                {
                    ApplicationArea = All;

                }

                field(HammerWeightT; Rec.HammerWeightT)
                {
                    ApplicationArea = All;

                }

                field(HammerImpactEnergykJ; Rec.HammerImpactEnergykJ)
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