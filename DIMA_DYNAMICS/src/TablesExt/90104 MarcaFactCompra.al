tableextension 90104 MarcaFactCompra extends "Purchase Line"
{
    fields
    {
        field(9; MarcaActivo; Code[20])
        {
            Caption = 'Marca Activo';
            TableRelation = DimaMarcas.CodMarca;
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