page 50900 SvayaRoleCenter
{
    PageType = RoleCenter;
    CaptionML = ENU = 'Svaya', RUS = 'Свая';

    layout
    {
        area(RoleCenter)
        {
        }
    }

    actions
    {
        area(Creation)
        {
            action(Projects)
            {
                CaptionML = ENU = 'Projects', RUS = 'Проекты';
                RunObject = Page Projects;
            }
        }

        area(Sections)
        {

            group("Group1")
            {
                CaptionML = RUS = 'Настройки';
                action(SectionsAction)
                {
                    ApplicationArea = all;
                    CaptionML = RUS = 'Техника';
                    RunObject = page EquipmentList;
                }
            }

        }
        /*
        area(Embedding)
        {
            action(EmbeddingAction)
            {
                //RunObject = Page ObjectName;
            }
        }
        */
    }

}

profile SvayaProfile
{
    ProfileDescription = 'Svaya Profile';
    RoleCenter = SvayaRoleCenter;
    Caption = 'Svaya profile';
}