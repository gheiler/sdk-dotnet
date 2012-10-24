<%@ Page Language="C#" %>
<%--
MercadoPago SDK
Checkout button with MD5 hash, using AJAX - MD5 Generator
@date 2012/03/29
@author hcasatti
--%>
<%@ Import Namespace="System.Security.Cryptography" %>
<%
// Get your Mercadopago credentials (CLIENT_ID and CLIENT_SECRET): 
// Argentina: https://www.mercadopago.com/mla/herramientas/aplicaciones 
// Brasil: https://www.mercadopago.com/mlb/ferramentas/aplicacoes

// Define item data according to form
string data =   "CLIENT_ID"+                    
                "CLIENT_SECRET"+                
                "1"+                            // item_quantity
                "ARS"+                          // item_currency_id
                "10.00"+                        // item_unit_price

                "CODE_012"+                     // item_id
                "BILL_001"+                     // external_reference
                ""+                             // excluded_payment_types_id
                ""+                             // excluded_payment_methods_id
                "";                             // credit_card_installments

// Get md5 hash
string md5 = "";
byte[] textBytes = System.Text.Encoding.Default.GetBytes (text);

MD5CryptoServiceProvider cryptHandler;
cryptHandler = new MD5CryptoServiceProvider ();
byte[] hash = cryptHandler.ComputeHash (textBytes);
foreach (byte a in hash) {
    md5 += a.ToString ("x2");
}

Response.Write ("{\"md5\":\""+md5+"\"}");
%>
