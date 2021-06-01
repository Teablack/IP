page 50031 "Seminar Room List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Room";
    CardPageId = "Seminar Room";
    Caption = 'Seminar Room List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Repeater3)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Address)
                {
                    ApplicationArea = All;
                }
                field(City; City)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = All;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = All;
                }

                field("Maximum Participants"; "Maximum Participants")
                {
                    ApplicationArea = All;
                }
                field("Internal/External"; "Internal/External")
                {
                    ApplicationArea = All;
                }

                field("Fax No."; "Fax No.")
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
                RunObject = page "Seminar Room";
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}