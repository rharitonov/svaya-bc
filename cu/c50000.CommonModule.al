codeunit 50000 CommonModule
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure CreatePileField(var TempPileFieldBuffer: Record PileFieldBuffer)
    var
        PileField: Record PileField;
        I: Integer;
    begin
        TempPileFieldBuffer.Reset();
        TempPileFieldBuffer.SetCurrentKey(PileFieldPositionFrom);
        if not TempPileFieldBuffer.FindSet() then
            exit;
        repeat
            for I := TempPileFieldBuffer.PileFieldPositionFrom to TempPileFieldBuffer.PileFieldPositionTo do begin
                PileField.Init();
                PileField.ProjectCode := TempPileFieldBuffer.ProjectCode;
                PileField.ProjectStructureCode := TempPileFieldBuffer.ProjectStructureCode;
                PileField.PileFieldPositionNo := I;
                PileField.PileType := TempPileFieldBuffer.PileType;
                PileField.Insert(true);
            end;
        until TempPileFieldBuffer.Next() = 0
    end;
}