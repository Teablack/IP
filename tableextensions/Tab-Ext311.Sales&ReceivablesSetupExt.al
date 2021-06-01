tableextension 50001 SalesReceExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
    }


}


