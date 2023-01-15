page 50011 JobLedgerEntries
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = JobLedgerEntry;
    CaptionML = ENU = 'Job Ledger Entries', RUS = 'Учтенные рабты';
    Editable = false;

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

                field(ProjectCode; Rec.ProjectCode)
                {
                    ApplicationArea = All;

                }

                field(ProjectStructureCode; Rec.ProjectStructureCode)
                {
                    ApplicationArea = All;

                }

                field(PileQACertificateNo; Rec.PileQACertificateNo)
                {
                    ApplicationArea = All;

                }

                field(PileQACertificateIssueDate; Rec.PileQACertificateIssueDate)
                {
                    ApplicationArea = All;

                }

                field(PostingDate; Rec.PostingDate)
                {
                    ApplicationArea = All;

                }


                field(SvItemNo; Rec.SvItemNo)
                {
                    ApplicationArea = All;

                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;

                }

                field(PileFieldPositionNo; Rec.PileFieldPositionNo)
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