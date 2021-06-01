xmlport 50000 "Participant Export XML"
{
    Direction = Export;
    Format = XML;
    UseRequestPage = true;
    Caption = 'Participant Export XML';
    schema
    {
        textelement(Seminar_Registration_Participant_List)
        {
            tableelement(Seminar; "Seminar Registration Header")
            {
                XmlName = 'Seminar';
                CalcFields = "Instructor Name";
                fieldelement(No; Seminar."No.")
                {
                    XmlName = 'Registration_No';
                }
                fieldelement(SemCode; Seminar."Seminar Code")
                {
                    XmlName = 'Seminar_Code';
                }

                fieldelement(SeminarName; Seminar."Seminar Name")
                {
                    XmlName = 'Seminar_Name';
                }

                fieldelement(StartingDate; Seminar."Starting Date")
                {
                    XmlName = 'Starting_Date';
                }
                fieldelement(SeminarDuration; Seminar."Seminar Duration")
                {
                    XmlName = 'Seminar_Duration';
                }
                fieldelement(InstructorName; Seminar."Instructor Name")
                {
                    XmlName = 'Instructor_Name';
                }
                fieldelement(RoomName; Seminar."Seminar Room Name")
                {
                    XmlName = 'Room_Name';
                }
                tableelement(Participant; "Seminar Registration Line")
                {
                    XmlName = 'Participant';
                    MinOccurs = Zero;
                    LinkTable = Seminar;
                    LinkFields = "Seminar Registration No." = field("No.");

                    fieldelement(CustomerNo; Participant."Bill-to Customer No.")
                    {
                        XmlName = 'Customer_No';
                    }
                    textelement(CustomerName)
                    {
                        XmlName = 'Customer_Name';
                        trigger OnBeforePassVariable()
                        var
                            Customer: Record Customer;
                        begin
                            Customer.get(Participant."Bill-to Customer No.");
                            CustomerName := Customer.Name;
                        end;
                    }
                    fieldelement(ContactNo; Participant."Participant Contact No.")
                    {
                        XmlName = 'Contact_No';
                    }
                    fieldelement(ParticipantName; Participant."Participant Name")
                    {
                        XmlName = 'Participant_Name';
                    }
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}