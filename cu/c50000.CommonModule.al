codeunit 50000 CommonModule
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure CreatePileField(var TempPileField: Record PileField)
    var
        PileField: Record PileField;
    begin
        TempPileField.Reset();
        if not TempPileField.FindSet() then
            exit;
        repeat
            PileField := TempPileField;
            PileField.Insert(true);
        until TempPileField.Next() = 0;

    end;
}