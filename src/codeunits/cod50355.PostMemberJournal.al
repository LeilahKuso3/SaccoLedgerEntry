codeunit 50355 "Post Member Journal"
{
    procedure PostJournalLine(var MemberJournalLine: Record "Member Journal Line")
    var
        MemberLedgerEntry: Record "Member Ledger Entry";
        MemberApp: Record "Member application table";
    begin
        // Validate
        if MemberJournalLine."Application no." = 0 then
            Error('Please select a member before posting.');

        if not MemberApp.Get(MemberJournalLine."Application no.") then
            Error('Member %1 does not exist.', MemberJournalLine."Application no.");

        if MemberJournalLine.Amount <= 0 then
            Error('Amount must be greater than zero.');

        if MemberJournalLine."Posting Date" = 0D then
            Error('Please enter a posting date.');

        // Copy into the permanent ledger
        MemberLedgerEntry.Init();
        MemberLedgerEntry."Application no." := MemberJournalLine."Application no.";
        MemberLedgerEntry."Member Name" := MemberJournalLine."Member Name";
        MemberLedgerEntry."Posting Date" := MemberJournalLine."Posting Date";
        MemberLedgerEntry."Entry Type" := MemberJournalLine."Entry Type";
        MemberLedgerEntry.Amount := MemberJournalLine.Amount;
        MemberLedgerEntry.Description := MemberJournalLine.Description;
        MemberLedgerEntry.Insert(true);

        // Step 3: Clear the scratch pad
        MemberJournalLine.Delete();
    end;
}