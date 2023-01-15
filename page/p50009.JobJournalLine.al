page 50009 JobJournalLine
{
    PageType = List;

    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = JobJournalLine;
    AutoSplitKey = true;
    DelayedInsert = true;
    PopulateAllFields = true;
    CaptionML = ENU = 'Job Journal Line', RUS = 'Строка журнала работ';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec.EntryType)
                {
                    ApplicationArea = All;
                }

                field(ProjectCode; Rec.ProjectCode)
                {
                    ApplicationArea = All;
                }

                field(ProjectStructCode; Rec.ProjectStructureCode)
                {
                    ApplicationArea = All;
                }

                field(ManufacturerNo; Rec.ManufacturerNo)
                {
                    ApplicationArea = All;
                }

                field(PileQACertNo; Rec.PileQACertificateNo)
                {
                    ApplicationArea = All;
                }

                field(PileQACertIssueDate; Rec.PileQACertificateIssueDate)
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

                field(Qunatity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field(PileFieldPositionNo; Rec.PileFieldPositionNo)
                {
                    ApplicationArea = All;
                }

                field(PileFieldPositionFrom; Rec.PileFieldPositionFrom)
                {
                    ApplicationArea = All;
                }


                field(PileFieldPositionTo; Rec.PileFieldPositionTo)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Post', RUS = 'Учет';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Codeunit.Run(Codeunit::JobJournalLinePost, Rec);
                end;
            }
        }
    }

}


//--