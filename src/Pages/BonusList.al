page 65400 "MNB List Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MNB Bonus Header";
    Editable = true;
    cardpageid = "MNB Card Page";
    caption = 'MNB Bonus List';


    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No"; Rec.No)
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

    var
        myInt: Integer;
}