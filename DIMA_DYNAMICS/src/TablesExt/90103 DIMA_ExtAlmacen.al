tableextension 90103 DIMA_ExtAlmacen extends "FA Location"
{
    fields
    {
        field(3; Code2; Code[10])
        {
            Caption = 'Code2';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
        serie: Codeunit "No. Series";

    trigger OnBeforeInsert()
    begin
        Rec.Code2 := serie.GetNextNo('ALMACEN-AF', WorkDate(), true);
        Rec.Code := Rec.Code2;
        Validate(Rec.Code);
    end;
}