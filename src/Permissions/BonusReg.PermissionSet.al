permissionset 65400 "MNB Bonus Reg."
{
    Assignable = true;
    // IncludedPermissionSets = SomePermissionSet;
    Permissions =
        tabledata "MNB Bonus Header" = RIMD,
        tabledata "MNB Bonus Entry" = RIMD,
        tabledata "MNB Bonus Line" = RIMD;
    Caption = 'MNB Bonus Reg. Permission';
}