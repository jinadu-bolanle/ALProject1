page 65402 "MNB Bonus Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MNB Bonus Line";
    caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the type of bonus line.';
                    caption = 'Type';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the item number associated with the bonus line.';
                    caption = 'Item No.';
                }
                field("Bonus Perc"; Rec."Bonus Perc")
                {
                    ApplicationArea = All;
                    tooltip = 'Specify the bonus percentage for the line.';
                    caption = 'Bonus %';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ExecuteAction)
            {
                ApplicationArea = All;
                Caption = 'Execute Action';
                Image = Action;


                trigger OnAction()
                begin
                    message('Action executed for bonus line: %1', Rec."Item No.");
                end;
            }
        }
    }

    var
        myInt: Integer;
}