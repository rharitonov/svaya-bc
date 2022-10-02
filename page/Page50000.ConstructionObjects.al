page 50000 ConstructionObjects
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ConstructionObject;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;

                }

                field("Type"; Rec."Type")
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

}