page 50040 "Seminar Registration Header"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Registration Header";
    Caption = 'Seminar Registration Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar Code"; "Seminar Code")
                {
                    ApplicationArea = All;
                }
                field("Seminar Name"; "Seminar Name")
                {
                    ApplicationArea = All;
                }
                field("Instructor Code"; "Instructor Code")
                {
                    ApplicationArea = All;
                }
                field("Instructor Name"; "Instructor Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;

                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field("Seminar Duration"; "Seminar Duration")
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
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
            }
            group("Seminar Room")
            {
                Caption = 'Seminar Room';
                field("Seminar Room Code"; "Seminar Room Code")
                {
                    ApplicationArea = All;

                }
                field("Seminar Room Name"; "Seminar Room Name")
                {
                    ApplicationArea = All;
                }
                field("Seminar Room Address"; "Seminar Room Address")
                {
                    ApplicationArea = All;
                }
                field("Seminar Room Address 2"; "Seminar Room Address 2")
                {
                    ApplicationArea = All;
                }
                field("Seminar Room Post Code"; "Seminar Room Post Code")
                {
                    ApplicationArea = All;
                }
                field("Seminar Room City"; "Seminar Room City")
                {
                    ApplicationArea = All;
                }
                field("Seminar Room Phone No."; "Seminar Room Phone No.")
                {
                    ApplicationArea = All;
                }
            }
            part("Seminar Registration Line"; "Seminar Registration Line")
            {
                SubPageLink = "Seminar Registration No." = field("No.");
                Caption = 'Rows';
            }
        }
    }


    actions
    {
        area(Processing)
        {

            action(createInvoice)
            {
                ApplicationArea = All;

                Caption = 'Create Invoice';
                Promoted = true;
                //PromotedOnly = true;
                PromotedIsBig = true;
                Image = SalesInvoice;

                trigger OnAction()
                var
                    SeminarRegHead: Record "Seminar Registration Header";
                begin
                    SeminarRegHead.Get("No.");
                    myCode.CreateSalesInvoice(SeminarRegHead);
                end;
            }
        }
        area(Reporting)
        {
            action("Seminar Participant List")
            {
                Caption = 'Seminar Participant List';
                ApplicationArea = All;
                Image = Report;
                trigger OnAction()
                var
                    SeminarRH: Record "Seminar Registration Header";
                begin
                    SeminarRH.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Seminar Participant List", true, false, SeminarRH);
                end;
            }

        }
    }


    var
        myCode: Codeunit "Seminar Management";
        myInt: Integer;
}
