codeunit 50001 JobJournalLinePost
{
    TableNo = JobJournalLine;

    trigger OnRun()
    begin
        Post(Rec);
    end;

    var
        myInt: Integer;

    procedure Post(var JobJournalLine: Record JobJournalLine)
    var
        JobLedgerEntry: Record JobLedgerEntry;
        PileNo: Integer;
    begin
        JobJournalLine.Reset();
        if not JobJournalLine.FindSet() then
            exit;
        repeat
            if JobJournalLine.PileFieldPositionFrom <> 0 then
                for PileNo := JobJournalLine.PileFieldPositionFrom to JobJournalLine.PileFieldPositionTo do begin
                    JobJournalLine.PileFieldPositionNo := PileNo;
                    CreatejobLedgerEntry(JobJournalLine);
                end
            else
                if JobJournalLine.PileFieldPositionNo > 0 then
                    CreatejobLedgerEntry(JobJournalLine);
        until JobJournalLine.Next() = 0;
    end;

    local procedure CreateJobLedgerEntry(var JobJournalLine: Record JobJournalLine)
    var
        JobLedgerEntry: Record JobLedgerEntry;
    begin
        JobLedgerEntry.Init();
        JobLedgerEntry.FindLast();
        JobLedgerEntry.EntryNo += 1;
        JobLedgerEntry.TransferFields(JobJournalLine);
        JobLedgerEntry.Insert(true);
    end;

}