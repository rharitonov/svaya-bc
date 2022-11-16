page 50009 PileJournalLine
{
    PageType = List;

    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = PileJournal;
    AutoSplitKey = true;
    DelayedInsert = true;
    PopulateAllFields = true;
    CaptionML = ENU = 'Pile Journal Line', RUS = 'Строка журнала работ';

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

                trigger OnAction();
                begin

                end;
            }
        }
    }
    
    var
    
}


//--