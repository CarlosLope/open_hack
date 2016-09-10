<%@ Page Title="" Language="C#" MasterPageFile="~/M_PopUp.Master" AutoEventWireup="true" CodeBehind="sucursalesO.aspx.cs" Inherits="OpenHack.Web.Catalogos.sucursalesO" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="PopupContent" runat="server">
<div id="div_General" class="container-fluid" >

        <br />

        

        <!-- MENSAJE -->
        <asp:UpdatePanel ID="up_Mensaje" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
               <!-- MENSAJE -->
                <div id="div_Mensaje" class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lbl_Mensaje" CssClass="label" runat="server" Text=" "></asp:Label>
                    </div>
                </div>
                      
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btn_Guardar"/>
            </Triggers>
        </asp:UpdatePanel>

         <hr />

        <!-- TABS -->
        <ul class="nav nav-pills">
            <li class="active"><a href="#tab_info" data-toggle="tab">Información</a></li>
        </ul>

        <!-- TAB PANES -->
        <div class="tab-content">
            
            <div class="tab-pane fade in active" id="tab_info">

                <br />

                <!-- DATOS -->
                <asp:UpdatePanel ID="up_Info" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:HiddenField ID="hd_id" runat="server" Value="0" />
                        <asp:HiddenField ID="hd_idEstados" runat="server" Value="0" />

                        <asp:DetailsView ID="dv_Datos" runat="server" 
                                    DataSourceID="MYSQL_Detalle" AutoGenerateRows="False" CssClass="table table-condensed table-bordered" 
                                    ondatabound="dv_Datos_DataBound" DataKeyNames="Id">
                            <Fields>
                                <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" ReadOnly="True" 
                                    SortExpression="Id"></asp:BoundField>
                               
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <div align="right">
                                            <label class="control-label">Empresa:</label>
                                        </div>  
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddl_Empresas" runat="server" DataSourceID="MYSQL_Empresas" 
                                            DataTextField="nombre" DataValueField="id" AutoPostBack="True" AppendDataBoundItems="True"
                                            CssClass="form-control" SelectedValue='<%# Bind("IdEmpresa") %>'>
                                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv8" runat="server" 
                                                ErrorMessage="*Seleccione.." InitialValue="0" ForeColor="Maroon" Font-Bold="true" Font-Names="Calibri" Font-Size="Small" Display="Dynamic" 
                                                ControlToValidate="ddl_Empresas"/>
                                        <asp:SqlDataSource ID="MYSQL_Empresas" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                                            SelectCommand="wCAT_obtEmpresasG" SelectCommandType="StoredProcedure">
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <div align="right">
                                            <label class="control-label">Nombre:</label>
                                        </div>  
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_Nombre" CssClass="form-control input-sm" MaxLength="100" Text='<%# Eval("nombre") %>' runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFV2" runat="server" 
                                                ErrorMessage="*Escriba un valor" ForeColor="Maroon" Font-Bold="true" Font-Names="Calibri" Font-Size="Small" Display="Dynamic" 
                                                ControlToValidate="txt_Nombre"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Fields>
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                        </asp:DetailsView>

                        <asp:SqlDataSource ID="MYSQL_Detalle" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                            SelectCommand="wCAT_obtSucursalesD" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hd_id" DefaultValue="1" Name="p_id" 
                                    PropertyName="Value" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <div class="row">
                            <div class="col-sm-12">
                                <asp:LinkButton ID="btn_Guardar" CssClass="btn btn-success btn-sm" runat="server" 
                                    onclick="btn_Guardar_Click"><i class="fa fa-save fa-fw"></i> Guardar</asp:LinkButton>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_Guardar"/>
                    </Triggers> 
                </asp:UpdatePanel>

            </div>

        </div>

    </div>
</asp:Content>
