report 50020 "Seminar List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts\SeminarList.rdl';
    Caption = 'Seminar List';

    dataset
    {
        dataitem("Seminar Registration Header"; "Seminar Registration Header")
        {
            RequestFilterFields = "Starting Date", "Seminar Code", Status;
            CalcFields = "Instructor Name";
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;

            column(No_Seminar; "No.")
            {
                IncludeCaption = true;
            }
            column(StartingDate; "Starting Date")
            {

                IncludeCaption = true;
            }
            column(SeminarCode; "Seminar Code")
            {
                IncludeCaption = true;
            }
            column(SeminarName; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(Amount; Amount)
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName())
            {

            }

            dataitem("Seminar Registration Line"; "Seminar Registration Line")
            {


                DataItemLink = "Seminar Registration No." = field("No.");
                CalcFields = "Participant Name";
                DataItemTableView = sorting("Seminar Registration No.");
                column(ParticipantContactNo; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantName; "Participant Name")
                {
                    IncludeCaption = true;
                }
                column(To_Invoice; "To Invoice")
                {

                    IncludeCaption = true;

                }
                column(Participated; Participated)
                {
                    IncludeCaption = true;
                }
                column(Seminar_Price; "Seminar Price")
                {
                    IncludeCaption = true;
                }
                column(Line_Discount; "Line Discount %")
                {
                    IncludeCaption = true;
                }
                column(Amount_Line; Amount)
                {
                    IncludeCaption = true;
                }
                column(ShowDetails; ShowDetails)
                {

                }

                // trigger OnAfterGetRecord() 
                //     begin
                //         "To Invoice".set
                //     end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {

                field("Show Details"; ShowDetails)
                {
                    Caption = 'Show Details';
                    ApplicationArea = All;

                }

            }
        }

    }

    labels
    {
        TitleLbl = 'Seminar List';
        PageLbl = 'Page';
        TotalLbl = 'Amount';
    }



    var
        myInt: Integer;
        ShowDetails: Boolean;
}