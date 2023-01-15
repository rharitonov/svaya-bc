codeunit 50001 JobJournalLinePost
{
    TableNo = JobJournalLine;

    trigger OnRun()
    begin
        //DeleteJobLedgerEntry();
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
            if JobJournalLine.EntryType = JobJournalLine.EntryType::QACertificatePosting then begin
                if JobJournalLine.Quantity > 0 then
                    for PileNo := 1 to JobJournalLine.Quantity do begin
                        JobJournalLine.Quantity := 1;
                        CreatejobLedgerEntry(JobJournalLine);
                        ArchiveJobJournalLine(JobJournalLine);
                    end
            end else begin
                if JobJournalLine.PileFieldPositionFrom <> 0 then
                    for PileNo := JobJournalLine.PileFieldPositionFrom to JobJournalLine.PileFieldPositionTo do begin
                        JobJournalLine.PileFieldPositionNo := PileNo;
                        JobJournalLine.Quantity := 1;
                        CreatejobLedgerEntry(JobJournalLine);
                    end
                else
                    if JobJournalLine.PileFieldPositionNo > 0 then begin
                        JobJournalLine.Quantity := 1;
                        CreatejobLedgerEntry(JobJournalLine);
                    end;

            end;
        until JobJournalLine.Next() = 0;
        JobJournalLine.Reset();
        JobJournalLine.DeleteAll();
    end;

    local procedure CreateJobLedgerEntry(var JobJournalLine: Record JobJournalLine)
    var
        JobLedgerEntry: Record JobLedgerEntry;
        NewEntryNo: Integer;
    begin
        JobLedgerEntry.Reset();
        if JobLedgerEntry.FindLast() then
            NewEntryNo := JobLedgerEntry.EntryNo + 1
        else
            NewEntryNo := 1;
        JobLedgerEntry.Init();

        JobLedgerEntry.TransferFields(JobJournalLine, false);
        JobLedgerEntry.EntryNo := NewEntryNo;
        JobLedgerEntry.Insert(true);
    end;

    local procedure ArchiveJobJournalLine(var JobJournalLine: Record JobJournalLine)
    var
        JobJnlLineArchive: Record JobJournalLineArchive;
        NewEntryNo: Integer;
    begin
        JobJnlLineArchive.Reset();
        if JobJnlLineArchive.FindLast() then
            NewEntryNo := JobJnlLineArchive.EntryNo + 1
        else
            NewEntryNo += 1;
        JobJnlLineArchive.TransferFields(JobJournalLine, false);
        JobJnlLineArchive.EntryNo := NewEntryNo;
        JobJnlLineArchive.Insert(true);
    end;

    local procedure DeleteJobLedgerEntry()
    var
        JobLedgerEntry: Record JobLedgerEntry;
        NewEntryNo: Integer;
    begin
        JobLedgerEntry.SetFilter(EntryNo, '..10');
        JobLedgerEntry.DeleteAll();
    end;


}