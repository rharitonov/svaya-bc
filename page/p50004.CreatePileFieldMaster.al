page 50004 CreatePileFieldMaster
{
    CaptionML = ENU = 'Create Pile Field Master', RUS = 'Создание свайного поля';
    PageType = StandardDialog;
    UsageCategory = Administration;
    SourceTable = PileField;
    SourceTableTemporary = true;
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ProjectCode; Rec.ProjectCode)
                {
                    ApplicationArea = All;
                }
            }
            repeater(lines)
            {
                field(PileType; Rec.PileType)
                {
                    ApplicationArea = All;

                }
                field(PileNumberFrom; Rec.PileNumberFrom)
                {
                    ApplicationArea = All;

                }
                field(PileNumberTo; Rec.PileNumberTo)
                {
                    ApplicationArea = All;

                }

                field(PileQuantity; Rec.PileNumberTo - Rec.PileNumberFrom + 1)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Pile Quantity', RUS = 'Количество свай';
                    Editable = false;
                }

            }

        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        CommonModule: Codeunit CommonModule;
    begin
        if CloseAction in [CloseAction::LookupOK, CloseAction::OK] then
            CommonModule.CreatePileField(Rec);
    end;

}