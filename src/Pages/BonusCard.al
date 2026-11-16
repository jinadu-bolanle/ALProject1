page 65401 "MNB Card Page"
{
    PageType = Document;
    caption = 'MNB Bonus Header Card';
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "MNB Bonus Header";
    editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the unique identifier for the bonus header.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the customer number associated with the bonus header.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the starting date for the bonus period.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the ending date for the bonus period.';
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                    tooltip = 'Indicates the current status of the bonus header.';
                }
            }

            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field(No);
                caption = 'Lines';
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                Image = Customer;
                RunObject = Page "Customer Card";
                RunPageLink = "No." = field("Customer No.");

            }
        }
    }

}
