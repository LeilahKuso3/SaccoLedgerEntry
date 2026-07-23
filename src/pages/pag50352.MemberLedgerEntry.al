page 50352 "Member Ledger Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Member Ledger Entry";
    Caption = 'Member Ledger Entries';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Application no."; Rec."Application no.")
                {
                    ApplicationArea = All;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            group(Applications)
            {
                actionref(MemberApplicationCardref; MemberApplicationCard) { }
                actionref(MemberApplicationListref; MemberApplicationList) { }
            }
            group("Member Journal Entries")
            {
                actionref(MemberJournalLineref; MemberJournalLine) { }
            }

        }
        area(Navigation)
        {
            group(Application)
            {
                Caption = 'Application';
                image = Apply;

                action(MemberApplicationCard)
                {
                    Caption = 'Application Card';
                    RunObject = Page "Member Application Card";
                    Image = Card;

                }
                action(MemberApplicationList)
                {
                    Caption = 'Member Applications';
                    RunObject = Page "Member Application List";
                    Image = List;

                }
            }

            action(MemberJournalLine)
            {
                Caption = 'Member Journal Line';
                RunObject = Page "Member Journal Line";
                Image = List;

            }
        }

    }
}

