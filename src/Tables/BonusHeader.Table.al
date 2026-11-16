table 65400 "MNB Bonus Header"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "MNB List Page";
    LookupPageId = "MNB List Page";

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = customerContent;
            Caption = 'No.';

        }
        field(2; "Customer No."; code[20])
        {
            DataClassification = customerContent;
            Caption = 'Customer No.';
            tableRelation = Customer."No.";
        }
        field(3; "Starting Date"; Date)
        {
            DataClassification = customerContent;
            Caption = 'Starting Date';
            trigger OnValidate()
            begin
                if "Starting Date" > "Ending Date" then
                    Error('Starting Date cannot be greater than Ending Date.');
            end;
        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = customerContent;
            Caption = 'Ending Date';
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                    "Ending Date" := "Starting Date";
            end;
        }
        field(5; "Status"; Enum "MNB Bonus Header Status")
        {
            DataClassification = customerContent;
            Caption = 'Status';
            // trigger OnValidate()
            // begin
            //     TestStatus();
            // end;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        ErrorMsg: Label 'You cannot delete a bonus of released status, %1';

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(ErrorMsg, Status);
    end;

    local procedure DeleteBonus()
    var
        MNBBonusLine: Record "MNB Bonus Line";
    begin
        MNBBonusLine.SetRange("Document No.", Rec.No);
        MNBBonusLine.DeleteAll();
        message('All bonus lines for document %1 have been deleted.', Rec.No);
    end;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        TestStatus();
        DeleteBonus();
    end;

    trigger OnRename()
    begin

    end;

}