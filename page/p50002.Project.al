page 50002 Project
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Project;
    CaptionML = ENU = 'Project', RUS = 'Карточка проекта';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ProjectCode; Rec."ProjectCode")
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
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
            action(CreatePileField)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Create Pile Field', RUS = 'Создать Свайное Поле';
                RunObject = page CreatePileFieldMaster;
                RunPageLink = ProjectCode = field(ProjectCode);
            }
        }

        area(Navigation)
        {
            action(PileLedgerEntries)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Pile Ledger Entries', RUS = 'Книга операций проекта';
                RunObject = page PileLedgerEntries;
                RunPageLink = ProjectCode = field(ProjectCode);
            }

            action(ProjectArea)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Project Area', RUS = 'Структура проекта';
                RunObject = page ProjectArea;
                RunPageLink = ProjectCode = field(ProjectCode);
            }
        }

    }

}