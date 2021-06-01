page 50050 "Seminar Registration Line"
{
    PageType = ListPart;
    SourceTable = "Seminar Registration Line";
    DelayedInsert = true;
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(Repeater4)
            {


                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = All;

                }
                field("Participant Contact No."; "Participant Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Participant Name"; "Participant Name")
                {
                    ApplicationArea = All;
                }
                field("Register Date"; "Register Date")
                {
                    ApplicationArea = All;
                }
                field("Confirmation Date"; "Confirmation Date")
                {
                    ApplicationArea = All;

                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;
                }

                field("Line Discount %"; "Line Discount %")
                {
                    ApplicationArea = All;
                }
                field("To Invoice"; "To Invoice")
                {
                    ApplicationArea = All;

                }
                field(Participated; Participated)
                {
                    ApplicationArea = All;
                }

                field("Line Discount Amount"; "Line Discount Amount")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
                field(Registered; Registered)
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; "Invoice No.")
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}