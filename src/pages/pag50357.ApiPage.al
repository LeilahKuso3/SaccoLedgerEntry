page 50358 "Member Ledger Entries API"
{
    PageType = API;
    APIPublisher = 'sacco';
    APIGroup = 'ledger';
    APIVersion = 'v1.0';
    EntityName = 'memberLedgerEntry';
    EntitySetName = 'memberLedgerEntries';
    SourceTable = "Member Ledger Entry";
    DelayedInsert = true;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(applicationNo; Rec."Application no.")
                {
                    Caption = 'Application No.';
                }
                field(memberName; Rec."Member Name")
                {
                    Caption = 'Member Name';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}