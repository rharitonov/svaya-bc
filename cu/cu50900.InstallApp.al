codeunit 50900 InstallApp
{
    Subtype = Install;

    trigger OnRun()
    begin

    end;

    procedure OnInstallAppPerCompany()
    var
        myInt: Integer;
        SVItem: Record SvItem;
    begin
        SVItem.SetRange("No.", 'С140.40-11.1.у');
        if SVItem.IsEmpty() then begin
            SVItem.Init();
            SVItem."No." := 'С140.40-11.1.у';
            SVItem.Description := StrSubstNo('Свая %1', SVItem."No.");
            SVItem.Insert(true);
        end;
    end;
}