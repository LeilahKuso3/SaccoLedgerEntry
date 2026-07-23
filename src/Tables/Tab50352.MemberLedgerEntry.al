table 50352 "Member Ledger Entry"
{
    Caption = 'Member Ledger Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Application no."; Integer)
        {
            Caption = 'Application no.';
            TableRelation = "Member application table"."Application no.";
        }
        field(3; "Member Name"; Text[60])
        {
            Caption = 'Member Name';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Entry Type"; Option)
        {
            OptionMembers = Contribution,"Loan Disbursement","Loan Repayment",Withdrawal;
            Caption = 'Entry Type';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}