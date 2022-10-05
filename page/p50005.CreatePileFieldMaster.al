page 50005 CreatePileFieldMaster
{
    CaptionML = ENU = 'Create Pile Field Master', RUS = 'Создание свайного поля';
    PageType = StandardDialog;
    UsageCategory = Administration;
    SourceTable = PileFieldBuffer;
    SourceTableTemporary = true;
    PopulateAllFields = true;
    DelayedInsert = true;

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
                field(PileNumberFrom; Rec.PileFieldPositionFrom)
                {
                    ApplicationArea = All;

                }
                field(PileNumberTo; Rec.PileFieldPositionTo)
                {
                    ApplicationArea = All;

                }

                field(PileQuantity; Rec.PileFieldPositionTo - Rec.PileFieldPositionFrom + 1)
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.LineNo += 1;
    end;

}