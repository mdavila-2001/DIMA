table 90101 DimaMarcas
{
    DataClassification = ToBeClassified;
    Caption = 'DIMA Marca Activos';

    fields
    {
        field(1; CodMarca; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; NombreMarca; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; CodMarca)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; CodMarca, NombreMarca) { }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}