pageextension 50001 SalesRecePageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Dynamics 365 Sales")
        {
            group("Seminar Module")
            {
                field("G/L Account No."; "G/L Account No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}