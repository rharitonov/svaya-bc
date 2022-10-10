page 50006 PileLedgerEntries
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = PileLedgerEntry;
    CaptionML = ENU = 'Pile Ledger Entries', RUS = 'Книга операций свай';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                }

                field(EntryType; Rec.EntryType)
                {
                    ApplicationArea = All;
                }

                field(ProjectNo; Rec.ProjectCode)
                {
                    ApplicationArea = All;
                }

                field(SvItemNo; Rec.SvItemNo)
                {
                    ApplicationArea = All;
                }

                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;
                }

                field(PostingDate; Rec.PostingDate)
                {
                    ApplicationArea = All;
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field(RemainingQuantity; Rec.RemainingQuantity)
                {
                    ApplicationArea = All;
                }

                field(Open; Rec.Open)
                {
                    ApplicationArea = All;
                }

            }
        }

    }

}