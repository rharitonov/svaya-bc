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
                CaptionML = ENU = 'General', RUS = 'Общее';
                field(ProjectCode; Rec."ProjectCode")
                {
                    ApplicationArea = All;

                }

                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
            }

            group(Jobs)
            {
                CaptionML = ENU = 'Jobs', RUS = 'Работы';
                part(DashBoard; ProjectDashboard)
                {
                    CaptionML = ENU = 'Job Progress', RUS = 'Выполнение';
                    ApplicationArea = All;
                    SubPageLink = ProjectCode = field(ProjectCode);
                }
            }

            group(Responsobilities)
            {
                CaptionML = ENU = 'Responsobilities', RUS = 'Отвественные лица и организации';
                field(ProjectEngineer; Rec.ProjectEngineer)
                {
                    ApplicationArea = All;
                }
                field(ProjectProducer; Rec.ProjectProducer)
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
            /*
            action(CreatePileField)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Create Pile Field', RUS = 'Создать Свайное Поле';
                RunObject = page CreatePileFieldMaster;
                RunPageLink = ProjectCode = field(ProjectCode);
            }
            */
            action(AddJob)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Add Job', RUS = 'Учесть выполнение работ';
                RunObject = Page JobJournalLine;
                RunPageLink = ProjectCode = field(ProjectCode);
            }
        }

        area(Reporting)
        {
            action(QACertJnlPrint)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Print QA Certificate Journal', RUS = 'Печать журнала входящего контроля';
                RunObject = report QACertificateJournal;
            }
        }

        area(Navigation)
        {
            action(JobLedgerEntries)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Job Ledger Entries', RUS = 'Учтенные работы';
                RunObject = page JobLedgerEntries;
                RunPageLink = ProjectCode = field(ProjectCode);
            }

            action(ProjectArea)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Project Structure', RUS = 'Структура проекта';
                RunObject = page ProjectStructure;
                RunPageLink = ProjectCode = field(ProjectCode);
            }
        }

    }

}