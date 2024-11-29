report 90102 DIMA_CuentasPorPagarProveedor
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'DIMA Cuentas por Pagar a Proveedores';

    dataset
    {
        dataitem(cabeceraProv; "Purch. Inv. Header")
        {
            column(NumCabecera; "No.") { }
            column(fechaCabecera; "Posting Date") { }
            column(Proveedor; "Pay-to Name") { }
            column(Contacto; "Buy-from Contact") { }
            column(FechaFactura; "Posting Date") { }
            column(FechaVencimiento; "Due Date") { }
            column(Término; "VAT Reporting Date") { }
            dataitem(detalleProveedor; "Purch. inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = SORTING("Document No.");
                column(No_Factura; "Document No.") { }
                column(NumProd; "No.") { }
                column(Monto_USD; "Line Amount") { }
                column(Reten; code.traerMontoRetencion("No.")) { }
                column(Monto_Giro_USD; code.traerGiroTotalUSD("No.")) { }
                column(Monto_Gross; code.traerGrossRetencion("No.")) { }
                column(Total_Costo_USD; code.traerCostoTotalUSD("No.")) { }
                column(Total_Giro_Bs; code.traerPrecioBOB("No.")) { }
                column(Ciudad; "Shortcut Dimension 1 Code") { }
            }
            dataitem(Proveedores; Vendor)
            {
                DataItemLink = "No." = field("Pay-to Vendor No.");
                DataItemTableView = SORTING("No.");
                column(TipoProv; code.traerTipoProv("No.")) { }
            }
            column(NombreEmpresa; CompanyInfo.Name) { }
            column(CiudadEmpresa; CompanyInfo.City) { }
            column(Direccion; CompanyInfo.Address) { }
            column(Telefono; CompanyInfo."Phone No.") { }
            column(Imagen; CompanyInfo.Picture) { }
            column(FechaI; FechaI) { }
            column(FechaF; FechaF) { }
            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", FechaI, FechaF);
                SetFilter(Closed, Format(Pagado));
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(FechaI; FechaI)
                    {
                        ApplicationArea = All;
                        Caption = 'Fecha Inicial';
                    }
                    field(FechaF; FechaF)
                    {
                        ApplicationArea = All;
                        Caption = 'Fecha Final';
                    }
                    field(Proveedor; cabeceraProv."Pay-to Name")
                    {
                        ApplicationArea = All;
                        Caption = 'Proveedor';
                        TableRelation = Vendor."No.";
                    }
                    field(Estado; Pagado)
                    {
                        ApplicationArea = All;
                        Caption = 'Pagado';
                    }
                    field(Proforma; cabeceraProv."No.")
                    {
                        ApplicationArea = All;
                        Caption = 'Proforma';
                        TableRelation = "Purch. Inv. Header"."No.";
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
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'src/ReportsLayout/DIMA Cuentas por Pagar Proveedor.rdl';
        }
    }

    var
        code: Codeunit DIMA_Logics;
        CompanyInfo: Record "Company Information";
        Pagado: Boolean;
        FechaI: Date;
        FechaF: Date;
}