page 50007 "My Role Center"
{
    PageType = RoleCenter;
    Caption = 'My Role Center';

    layout
    {
    }

    actions
    {
        area(Sections)
        {
            group(Lists)
            {
                Caption = 'Lists';
                action(Seminars)
                {
                    ApplicationArea = All;
                    Caption = 'Seminars';
                    RunObject = page "Seminar List";
                }
                action(Instructors)
                {
                    ApplicationArea = All;
                    Caption = 'Instructors';
                    RunObject = page "Instructor List";
                }
                action("Seminar Rooms")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Room List';
                    RunObject = page "Seminar Room List";
                }
                action("Seminar Registration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registration List';
                    RunObject = page "Seminar Registration List";
                }
            }
            group(Tasks)
            {
                Caption = 'Tasks';
                action("Export")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Export XML';
                    RunObject = xmlport "Participant Export XML";

                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                action("Seminar Participant List")
                {
                    Caption = 'Seminar Participant List';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Seminar Participant List";

                }

                action("Seminar List")
                {
                    Caption = 'Seminar List';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Seminar List";

                }
            }
        }
    }

    var
        myInt: Integer;


}

profile SeminarManager
{
    Caption = 'Seminar Manager';
    RoleCenter = "My Role Center";
}