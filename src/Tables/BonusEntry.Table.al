table 65402 "MNB Bonus Entry"
{
    DataClassification = CustomerContent;
    caption = 'MNB Bonus Entry';
    drilldownpageid = "MNB Bonus Entries";
    lookuppageid = "MNB Bonus Entries";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No';
            AutoIncrement = true;
            editable = false;

        }
        field(2; "Bonus No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus No.';
            tableRelation = "MNB Bonus Header".No;
            editable = false;
        }


        field(3; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            tableRelation = "Sales Header"."No.";
            editable = false;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            tableRelation = "Item"."No.";
            editable = false;
        }
        field(5; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
            editable = false;
        }
        field(6; "Bonus Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Amount';
            editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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

    end;

}