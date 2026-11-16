tableextension 65400 "MNB Customer" extends Customer
{
    fields
    {
        field(65400; "MNB Bonuses"; Integer)
        {
            Caption = 'MNB Bonuses';
            editable = false;
            fieldClass = FlowField;
            CalcFormula = Count("MNB Bonus Header" where("Customer No." = field("No.")));
            // DataClassification = CustomerContent;
        }  // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        AtleastOneBonusCustomeExistErr: Label 'At least one bonus exist for customer %1';

    local procedure TestIfBonusExist()
    var
        MNBBonusHeader: Record "MNB Bonus Header";
    begin
        MNBBonusHeader.SetRange("Customer No.", Rec."No.");
        if not MNBBonusHeader.IsEmpty() then
            Error(AtleastOneBonusCustomeExistErr, Rec."No.");
    end;

    trigger OnBeforeDelete()

    begin
        TestIfBonusExist();
    end;
}