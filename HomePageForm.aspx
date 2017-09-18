<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePageForm.aspx.cs" Inherits="webFormspractise.HomePageForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #topBar{
        width: 90%;
     background-color:darkgrey; 
            margin-left: 5%;
            margin-bottom: 5%;
        }
        #setGrid {
            width: 80%;
            margin-left: 10%;
            margin-top: 2%;
        }
        .hdrow {
            text-align: center;
            color: White;
            background-color: black;
            height: 30px;
        }
       .gridview{
            /*background-color: white;
            margin: 0px auto;*/
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <div id="topBar">
     <asp:Label ID="lbl_Currentuser" runat="server" style="margin-left:60%;" ForeColor="Brown" Text="Current Signed In User:"></asp:Label>
     <asp:Label ID="lbl_loginUser" ForeColor="White" style="margin-left:1%;" runat="server"></asp:Label>
     <asp:Button ID="btn_signOut" runat="server" style="margin-left:5%;" ForeColor="Brown" OnClick="btn_signOut_Click" Text="SignOut" />
 </div>
<div id="setGrid">       
             <asp:GridView ID="gv1" runat="server" Width="100%" PageSize="5" AllowPaging="true" CssClass="gridview" AutoGenerateColumns="false" DataKeyNames="user_id" OnPageIndexChanging="gv1_PageIndexChanging" OnRowCancelingEdit="gv1_RowCancelingEdit" OnRowDeleting="gv1_RowDeleting" OnRowEditing="gv1_RowEditing" OnRowUpdating="gv1_RowUpdating">
                 <AlternatingRowStyle BackColor="LightGray"/>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle CssClass="hdrow" />
                    <HeaderTemplate>
                        <asp:Label ID="hlbl_id" runat="server" Text="User Id"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("user_id") %>'>  
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderStyle CssClass="hdrow" />
                    <HeaderTemplate>
                        <asp:Label ID="hlbl_firstName" runat="server" Text="First Name"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_firstName" runat="server" Text='<%# Eval("first_name") %>'>  
                        </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_firstName" style="margin-left:0px; width:90%;" runat="server" Text='<%# Eval("first_name") %>'>  
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderStyle CssClass="hdrow" />
                    <HeaderTemplate>
                        <asp:Label ID="hlbl_lastName" runat="server" Text="Last Name"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_lastName" runat="server" Text='<%# Eval("last_name") %>'>  
                        </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_lastName" style="margin-left:0px; width:90%;" runat="server" Text='<%# Eval("last_name") %>'>  
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderStyle CssClass="hdrow" />
                    <HeaderTemplate>
                        <asp:Label ID="hlbl_email" runat="server" Text="Email"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_email" runat="server" Text='<%# Eval("email") %>'>  
                        </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_email" style="margin-left:0px; width:90%;" runat="server" Text='<%# Eval("email") %>'>  
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderStyle CssClass="hdrow" />
                    <HeaderTemplate>
                        <asp:Label ID="hlbl_password" runat="server" Text="Password"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_password" runat="server" Text='<%# Eval("password") %>'>  
                        </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_password" style="margin-left:0px; width:90%;" runat="server" Text='<%# Eval("password") %>'>  
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderStyle CssClass="hdrow" />
                    <HeaderTemplate>
                        <asp:Label ID="hlbl_actions" runat="server" Text="Actions"></asp:Label>
                    </HeaderTemplate>
                     <ItemTemplate>
                        <asp:Button ID="btnedit" CausesValidation="false" BackColor="DarkGray" ForeColor="Black" runat="server" Text="Edit" CommandName="Edit" />
                        <asp:Button ID="btndelete" CausesValidation="false" BackColor="DarkGray" ForeColor="Red" runat="server" Text="Delete" CommandName="Delete" />
                    </ItemTemplate> 
                    <EditItemTemplate>
                        <asp:Button ID="btnupdate" CausesValidation="false" BackColor="DarkGray" ForeColor="White" runat="server" Text="Update" CommandName="Update" />
                        <asp:Button ID="btncancel" CausesValidation="false" BackColor="DarkGray" ForeColor="Black" runat="server" Text="Cancel" CommandName="Cancel" />
                        <asp:Button ID="btnDelete" CausesValidation="false" BackColor="DarkGray" ForeColor="Red" runat="server" Text="Delete" CommandName="Delete" />
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
     </div>    
 </div>
    </form>
</body>
</html>
