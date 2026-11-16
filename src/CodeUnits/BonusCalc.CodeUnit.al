codeunit 65400 "MNB Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', false, false)]
    local procedure OnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        calculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusHeader: Record "MNB Bonus Header";
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;
        bonusHeader.SetRange("Customer No.", SalesInvLine."Sell-to Customer No.");
        bonusHeader.SetRange("Status", bonusHeader.Status::Released);
        bonusHeader.SetFilter("Starting Date", '..%1', SalesInvLine."Posting Date");
        bonusHeader.SetFilter("Ending Date", '%1..', SalesInvLine."Posting Date");
        if bonusHeader.FindFirst() then
            repeat
                findBonusForAllItem(bonusHeader, SalesInvLine);
                findBonusForOneItem(bonusHeader, SalesInvLine);
            until bonusHeader.Next() = 0;
    end;

    local procedure FindBonusForAllItem(var BonusHeader: record "MNB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record "MNB Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader.No);
        BonusLine.SetRange(type, BonusLine.Type::AllItems);
        if not BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;



    local procedure FindBonusForOneItem(var BonusHeader: record "MNB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusLine: Record "MNB Bonus Line";
    begin
        BonusLine.SetRange("Document No.", BonusHeader.No);
        BonusLine.SetRange("Item No.", SalesInvLine."No.");
        bonusLine.SetRange("Item No.", SalesInvLine."No.");
        if not BonusLine.FindFirst() then
            InsertBonusEntry(BonusLine, SalesInvLine);
    end;

    local procedure InsertBonusEntry(var BonusLine: record "MNB Bonus Line"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BonusEntry: Record "MNB Bonus Entry";
    begin
        Bonusentry.Init();
        BonusEntry."Entry No" := 0;
        BonusEntry."Bonus No." := BonusLine."Document No.";
        BonusEntry."Document No." := salesInvLine."Document No.";
        BonusEntry."Item No." := SalesInvLine."No.";
        BonusEntry."Posting Date" := salesInvLine."Posting Date";
        BonusEntry."Bonus Amount" := salesInvLine."Line Amount" * BonusLine."Bonus Perc" / 100;
        onBeforeInsertBonusEntry(BonusLine, SalesInvLine);
        BonusEntry.Insert();
        onAfterInsertBonusEntry(BonusLine, SalesInvLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertBonusEntry(MNBBonusLine: Record "MNB Bonus Line"; SalesInvLine: Record "Sales Invoice Line")
    begin
    end;

    local procedure OnAfterInsertBonusEntry(MNBBonusLine: Record "MNB Bonus Line"; SalesInvLine: Record "Sales Invoice Line")
    begin
    end;
}

