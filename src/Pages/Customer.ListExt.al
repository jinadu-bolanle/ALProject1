pageextension 65402 "MNB Customer List" extends "Customer List"

{
    layout
    {
        addlast(Control1)
        {

            field("MNB No. of Bonuses"; Rec."MNB Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Displays the total number of MNB bonuses associated with the customer.';
            }

        }

    }
    actions
    {
        addlast(navigation)
        {
            action(MNBBONUSES)
            {
                ApplicationArea = All;
                Caption = 'Open MNB List';
                Image = Discount;
                RunObject = Page "MNB List Page";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}