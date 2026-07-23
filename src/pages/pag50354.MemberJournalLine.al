page 50354 "Member Journal Line"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Member Journal Line";
    Caption = 'Member Journal';
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Caption = 'Post';
                Image = Post;
                trigger OnAction()
                var
                    PostMemberJournal: Codeunit "Post Member Journal";
                begin
                    PostMemberJournal.PostJournalLine(Rec);
                    Message('Line posted successfully.');
                end;
            }
        }
        area(Promoted)
        {
            group(Applications)
            {
                actionref(MemberApplicationCardref; MemberApplicationCard) { }
                actionref(MemberApplicationListref; MemberApplicationList) { }
            }
            group("Member Journal Entries")
            {
                actionref(MemberLedgerEntriesListref; MemberLedgerEntriesList) { }
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
                    Caption = 'Application List';
                    RunObject = Page "Member Application List";
                    Image = List;

                }
            }

            action(MemberLedgerEntriesList)
            {
                Caption = 'Member Ledger Entries';
                RunObject = Page "Member Ledger Entries";
                Image = List;

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

