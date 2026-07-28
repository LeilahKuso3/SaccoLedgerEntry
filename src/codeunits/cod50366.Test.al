codeunit 50357 "Member Journal Post Tests"
{
    Subtype = Test;

    var
        Assert: Codeunit "Post Member Journal";

    [Test]
    procedure PostingZeroAmountShouldFail()
    var
        MemberJournalLine: Record "Member Journal Line";
        PostMemberJournal: Codeunit "Post Member Journal";
    begin
        // Given: a journal line with amount = 0
        MemberJournalLine.Init();
        MemberJournalLine."Line No." := 998;
        MemberJournalLine."Application no." := 1;
        MemberJournalLine."Posting Date" := Today();
        MemberJournalLine."Entry Type" := MemberJournalLine."Entry Type"::Contribution;
        MemberJournalLine.Amount := 0;
        MemberJournalLine.Insert();

        // When / Then: posting it should raise an error
        asserterror PostMemberJournal.PostJournalLine(MemberJournalLine);
    end;

    [Test]
    procedure PostingDeletesTheJournalLine()
    var
        MemberJournalLine: Record "Member Journal Line";
        PostMemberJournal: Codeunit "Post Member Journal";
        PostedLineNo: Integer;
    begin
        MemberJournalLine.Init();
        MemberJournalLine."Line No." := 999;
        MemberJournalLine."Application no." := 1;
        MemberJournalLine."Posting Date" := Today();
        MemberJournalLine."Entry Type" := MemberJournalLine."Entry Type"::Contribution;
        MemberJournalLine.Amount := 5000;
        MemberJournalLine.Insert();
        PostedLineNo := MemberJournalLine."Line No.";

        // when posting the line
        PostMemberJournal.PostJournalLine(MemberJournalLine);

        // Then: the line should no longer exist in the journal
        if MemberJournalLine.Get(PostedLineNo) then
            Error('The journal line should have been deleted after posting.');
    end;
}