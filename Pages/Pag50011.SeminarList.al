page 50011 "Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Seminar;
    CardPageId = Seminar;
    Editable = false;

    layout
    {
        area(Content)
        {

            repeater(Repeater1)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }

                field("Seminar Duration"; "Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = All;

                }
                field("Minimum Participants"; "Minimum Participants")
                {
                    ApplicationArea = All;

                }

                field("Maximum Participants"; "Maximum Participants")
                {
                    ApplicationArea = All;

                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;

                }

                field("Seminar Price"; "Seminar Price")
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
            action(ActionName)
            {
                ApplicationArea = All;
                RunObject = page Seminar;
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}