page 65403 "MNB Bonus Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = history;
    SourceTable = "MNB Bonus Entry";
    DeleteAllowed = false;
    insertAllowed = false;
    modifyAllowed = false;
    caption = 'MNB Bonus Entry List';
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    tooltip = 'Specifies the unique identifier for the bonus entry.';
                    Caption = 'Entry No';
                }
                field("Bonus No."; Rec."Bonus No.")
                {
                    ApplicationArea = All;
                    tooltip = 'Specifies the bonus number.';
                    Caption = 'Bonus No.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    tooltip = 'Specifies the document number.';
                    Caption = 'Document No.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    tooltip = 'Specifies the item number.';
                    Caption = 'Item No.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    tooltip = 'Specifies the posting date.';
                    Caption = 'Posting Date';
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                    tooltip = 'Specifies the bonus amount.';
                    Caption = 'Bonus Amount';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Bonus Card';
                Image = Customer;
                RunObject = Page "MNB Card Page";
                //RunPageLink = "No." = field("Bonus No.");
            }
        }

    }

    var
        myInt: Integer;
}