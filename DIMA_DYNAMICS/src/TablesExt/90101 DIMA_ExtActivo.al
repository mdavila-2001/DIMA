tableextension 90101 DIMA_ExtActivo extends "Fixed Asset"
{
    fields
    {
        field(1003; MarcaActivo; Code[20])
        {
            Caption = 'Marca';
            TableRelation = DimaMarcas.CodMarca;
        }
        field(1004; Modelo; Text[50])
        {
            Caption = 'Modelo';
        }
        field(1005; Color; Text[50])
        {
            Caption = 'Color';
        }
        field(1006; Otros; Text[50])
        {
            Caption = 'Otros';
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
}