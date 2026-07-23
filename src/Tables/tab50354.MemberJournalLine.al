table 50354 "Member Journal Line"
{
    Caption = 'Member Journal Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(2; "Application no."; Integer)
        {
            Caption = 'Application no.';
            TableRelation = "Member application table"."Application no.";

            trigger OnValidate()
            var
                MemberApp: Record "Member application table";
            begin
                if MemberApp.Get("Application no.") then
                    "Member Name" := MemberApp."First Name" + ' ' + MemberApp."Last Name";
            end;
        }
        field(3; "Member Name"; Text[60])
        {
            Caption = 'Member Name';
            Editable = false;
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
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}