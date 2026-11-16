report 65400 "MNB Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ExcelLayout = './src/Reports/Bonus_Report.xlsx';
    Caption = 'MNB Bonus Overview';
    DefaultLayout = Excel;

    dataset
    {
        dataitem("MNB Bonus Header"; "MNB Bonus Header")
        {
            requestfilterfields = No, "Customer No.";
            column(No; No)
            {

            }
            column(CustomerNo; "Customer No.")
            {

            }
            column(Starting_Date; "Starting Date")
            {

            }
            column(Ending_Date; "Ending Date")
            {

            }
            dataitem("MNB Bonus Entry"; "MNB Bonus Entry")
            {
                DataItemLink = "bonus No." = field(No);

                column(ItemNo; "Item No.")
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(Posting_Date; "Posting Date")
                {

                }
                column(Bonus_Amount; "Bonus Amount")
                {

                }

            }
        }
    }

    requestpage
    {
        AboutTitle = 'Specify the parameters for the MNB Bonus Overview report';
        AboutText = 'Specify the parameters for the MNB Bonus Overview report. The report will generate a list of bonus entries based on the selected criteria.';
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field(StartingDate; "mnb bonus header"."Starting Date")
                    {

                    }
                    field(EndingDate; "mnb bonus header"."Ending Date")
                    {



                    }


                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    var
        myInt: Integer;

    trigger OnInitReport()
    var
        myInt: Integer;
    begin

    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;
}