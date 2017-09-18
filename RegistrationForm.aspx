<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="webFormspractise.RegistraionForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="myPlaceHolder" runat="server">
                <fieldset style="width: 500px; margin-left: 350px; margin-top: 120px;">
                    <legend>Register a new User</legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_firstName" runat="server" Text="First Name: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_firstName" placeholder="e.g. Awais" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_firstName" ForeColor="Red" ControlToValidate="txt_firstName" runat="server" ErrorMessage="please enter your first Name."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_lastName" runat="server" Text="Last Name: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_lastName" placeholder="e.g. Mughal" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_lastName" ForeColor="Red" ControlToValidate="txt_lastName" runat="server" ErrorMessage="please enter your last Name."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_email" runat="server" Text="Email: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_email" placeholder="e.g. someone@yahoo.com" runat="server"></asp:TextBox>
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
                            <td>
                                <asp:Label ID="lbl_confrimPassword" runat="server" Text="Confirm Password: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_confrimPassword" TextMode="Password" placeholder="********" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_confrimPassword" ForeColor="Red" ControlToValidate="txt_confrimPassword" runat="server" ErrorMessage="please re-enter your password."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                            </td>
                            <td>
                                       <asp:CompareValidator ID="CompareValidator_password" ControlToValidate="txt_password" ControlToCompare="txt_confrimPassword" ForeColor="Red" runat="server" ErrorMessage="Both passwords are not same."></asp:CompareValidator>
                         
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btn_signUp" runat="server" Text="Register" OnClick="btn_signUp_Click" ForeColor="Green" />
                                     </td>
                            <td>
                                 <p> <a href="LoginForm.aspx"><--Back to Login--</a></p>
                      
                            </td>
                        </tr>

                    </table>

                </fieldset>
            </asp:PlaceHolder>

        </div>
    </form>
</body>
</html>
