table 65401 "MNB Bonus Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = customerContent;
            Caption = 'Document No.';
            tableRelation = "MNB Bonus Header".No;

        }
        field(2; Type; enum "MNB Bonus Line Type")
        {
            DataClassification = customerContent;
            Caption = 'Type';
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = customerContent;
            Caption = 'Item No.';
            tableRelation = Item."No.";
        }
        field(4; "Bonus Perc"; Integer)
        {
            DataClassification = customerContent;
            Caption = 'Quantity';
            minValue = 0;
            maxValue = 100;
        }
    }

    keys
    {
        key(PK; "Document No.", Type, "Item No.")
        {
            Clustered = true;

        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        ErrMsg: Label 'You can not modify Lines for a realeased Bonus Header, %1';

    local procedure CannotModifyLines()
    var
        MNBBonusHeader: Record "MNB Bonus Header";
    begin
        if MNBBonusHeader.Get(Rec."Document No.") then
            if MNBBonusHeader.Status = mnbbonusheader.Status::Released then
                Error(ErrMsg, MNBBonusHeader.Status);

    end;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        CannotModifyLines();
    end;


}