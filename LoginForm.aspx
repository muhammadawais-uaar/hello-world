<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="webFormspractise.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="myPlaceHolder" runat="server">
                <fieldset style="width:430px; margin-left:350px; margin-top:120px;">
                    <legend>Login a User</legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_email" runat="server" Text="Email: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_email" TextMode="Email" placeholder="e.g. someone@gmail.com" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_email" ForeColor="Red" ControlToValidate="txt_email" runat="server" ErrorMessage="please enter your email."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_password" TextMode="Password" placeholder="********" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" ForeColor="Red" ControlToValidate="txt_password" runat="server" ErrorMessage="please enter your password."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" ForeColor="Green" />
                                       </td>
                            <td></td>
                        </tr>
                        <tr><td></td><td></td><td></td></tr>
                        <tr>
                            <td></td>
                            <td>
                                <p>Are you a new user? </p>
                            </td>
                            <td>
                                        <p> <a href="RegistrationForm.aspx">Signup</a> here.</p>
                        
                            </td><td></td>
                        </tr>
                    </table>

                </fieldset>
            </asp:PlaceHolder>

        </div>
    </form>
</body>
</html>
