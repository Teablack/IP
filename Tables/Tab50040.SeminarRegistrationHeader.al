Table 50040 "Seminar Registration Header"
{
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            trigger OnValidate()
            begin
                if Status <> Status::Planning then
                    Error(StartingDateCantBeModErr)
            end;
        }
        field(3; "Seminar Code"; Code[20])
        {
            Caption = 'Seminar';
            TableRelation = "Seminar";

            trigger OnValidate()
            var
                Seminar: Record Seminar;
                SeminarRegLine: Record "Seminar Registration Line";
            begin
                if Seminar.Get("Seminar Code") then begin
                    Seminar.TestField(Seminar.Blocked, false);
                    "Seminar Name" := Seminar.Name;
                    "Seminar Duration" := Seminar."Seminar Duration";
                    "Minimum Participants" := Seminar."Minimum Participants";
                    "Maximum Participants" := Seminar."Maximum Participants";
                    Validate("Seminar Price", Seminar."Seminar Price");
                    //calcf amount
                end else begin
                    "Seminar Name" := '';
                    "Seminar Duration" := 0;
                    "Minimum Participants" := 0;
                    "Maximum Participants" := 0;
                    "Seminar Price" := 0;

                end;

                SeminarRegLine.Reset();
                SeminarRegLine.SetRange(SeminarRegLine."Seminar Registration No.", "No.");
                if SeminarRegLine.FindSet() then
                    repeat
                        if SeminarRegLine.Registered then
                            Error(SeminarWithRegisteredLinesModifyErr);
                    until SeminarRegLine.Next() = 0;
            end;
        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
        }
        field(5; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = "Instructor";
            trigger OnValidate()
            begin
                CalcFields("Instructor Name");
            end;
        }
        field(6; "Instructor Name"; Text[50])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Instructor.Name where("Code" = field("Instructor Code")));
            Editable = false;
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Planning,Registration,Finished,Cancelled;
            OptionCaption = 'Planning, Registration, Finished, Cancelled';
        }
        field(8; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(9; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(10; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(11; "Seminar Room Code"; Code[20])
        {
            Caption = 'Seminar Room Code';
            TableRelation = "Seminar Room";
            trigger OnValidate()
            var
                SeminarRoom: Record "Seminar Room";
            begin
                if SeminarRoom.Get("Seminar Room Code") then begin

                    "Seminar Room Name" := SeminarRoom.Name;
                    "Seminar Room Address" := SeminarRoom."Address";
                    "Seminar Room Address 2" := SeminarRoom."Address 2";
                    "Seminar Room Post Code" := SeminarRoom."Post Code";
                    "Seminar Room Phone No." := SeminarRoom."Phone No.";
                    "Seminar Room City" := SeminarRoom.City;
                    CalcFields(Amount);
                end else begin
                    "Seminar Room Name" := '';
                    "Seminar Room Address" := '';
                    "Seminar Room Address 2" := '';
                    "Seminar Room Post Code" := '';
                    "Seminar Room Phone No." := '';
                    "Seminar Room City" := '';

                end;
            end;
        }
        field(12; "Seminar Room Name"; Text[50])
        {
            Caption = 'Seminar Room Name';
        }
        field(13; "Seminar Room Address"; Text[50])
        {
            Caption = 'Seminar Room Address';
        }
        field(14; "Seminar Room Address 2"; Text[50])
        {
            Caption = 'Seminar Room Address 2';
        }
        field(15; "Seminar Room Post Code"; Code[20])
        {
            Caption = 'Seminar Room Post Code';
            TableRelation = "Post Code";
        }
        field(16; "Seminar Room City"; Text[30])
        {
            Caption = 'Seminar Room City';
        }
        field(17; "Seminar Room Phone No."; Text[30])
        {
            Caption = 'Seminar Room Phone No';
        }
        field(18; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(19; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            trigger OnValidate()
            var
                SeminarRegLine: Record "Seminar Registration Line";
                Question: Text;
                Answer: Boolean;

            begin
                Question := TextQ;
                Answer := Dialog.Confirm(Question, true);
                if (Answer) then begin

                    if (Status <> Status::Cancelled) then begin

                        SeminarRegLine.Reset();
                        SeminarRegLine.SetRange(SeminarRegLine."Seminar Registration No.", "No.");
                        if SeminarRegLine.FindSet() then
                            repeat
                                if SeminarRegLine.Registered <> true then begin
                                    SeminarRegLine.Validate(SeminarRegLine."Seminar Price", "Seminar Price");
                                    SeminarRegLine.Modify();
                                    CalcFields(Amount);
                                end;
                            until SeminarRegLine.Next() = 0;
                    end;
                end;


            end;
        }
        field(20; Amount; Decimal)
        {
            Caption = 'Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Seminar Registration Line".Amount where("Seminar Registration No." = field("No.")));
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger onInsert()
    begin
        "Posting Date" := WorkDate();
    end;

    trigger OnDelete()
    begin
        if Status <> Status::Planning then
            Error(SeminarCantBeDeletedErr)
    end;

    trigger OnRename()
    begin
        Error(RecNameCantBeModifiedErr);
    end;

    var
        SeminarWithRegisteredLinesModifyErr: label 'Seminars with registered lines cannot be modified';
        SeminarCantBeDeletedErr: label 'Only planned seminars can be deleted';
        RecNameCantBeModifiedErr: label 'Record name cannot be modified';
        StartingDateCantBeModErr: label 'Starting date can be modified just when status is Planned';
        TextQ: label 'Do you want to change Seminar Price?';
}