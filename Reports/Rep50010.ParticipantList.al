report 50010 "Seminar Participant List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts\SeminarParticipantList.rdl';
    Caption = 'Seminar Participant List';

    dataset
    {
        dataitem("Seminar Registration Header"; "Seminar Registration Header")
        {
            RequestFilterFields = "No.";
            CalcFields = "Instructor Name";
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;

            column(No_SeminarRegistrationHeader; "No.")
            {
                IncludeCaption = true;
            }
            column(SeminarCode_SeminarRegistrationHeader; "Seminar Code")
            {
                IncludeCaption = true;
            }
            column(SeminarName_SeminarRegistrationHeader; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(SeminarDuration_SeminarRegistrationHeader; "Seminar Duration")
            {
                IncludeCaption = true;
            }
            column(InstructorName_SeminarRegistrationHeader; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(SeminarRoomName_SeminarRegistrationHeader; "Seminar Room Name")
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

                column(BilltoCustomerNo_SeminarRegistrationLine; "Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo_SeminarRegistrationLine; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantName_SeminarRegistrationLine; "Participant Name")
                {
                    IncludeCaption = true;
                }
            }
        }
    }


    labels
    {
        TitleLbl = 'Seminar Participant List';
        PageLbl = 'Page';
        ParticipantsPerRegistrationLbl = 'Participants per Registration';
        TotalLbl = 'Total';
    }


    var
        myInt: Integer;
}
