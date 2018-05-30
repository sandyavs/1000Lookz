
## JSP Pages for Customer:


 #### Customer Signup:
          1.Signup.jsp>>valid_SignUp.jsp>>ExistSignup.jsp(If the customer already have an account goes to existsignup.jsp) ELSE >>CInsert_Signup.jsp>>CRegister_Success.jsp(If successfully registered) ELSE CRegister_Fail.jsp.
          
#### Customer Login:
        1.CLogin.jsp>>validLogin.jsp(This jsp checks if customer is already registered)>>LoginValid1.jsp(Checks IF login details already existing in database If not insertion takes place)>>LoginSuccess.jsp ELSE >>CInsert_Login.jsp.
        
#### Customer Cart:
        1.Ccart1.jsp>>ReceiveCcart.jsp(Checks if correct Product ID has been entered)>>Ccart2.jsp>>Cost.jsp(Calculates the cost of the product based on the quantity provided)>>Ccart3.jsp>>Cust_Cart_table.jsp.
        2.LoginSuccess.jsp(If u select go to cart )>>TableCcart.jsp(Shows the cart details of logged in user).
        3.Cust_Cart_form.jsp(This page has option to update and delete cart details)>>Update_Cust_Cart.jsp.UpdateCcart1.jsp>>UpdateCost.jsp>>Updatecart3.jsp>>UpdateCart4.jsp>>Cust_Cart_table.jsp.
        
 #### Customer Order:
       1.LoginSuccess.jsp>>COrder1.jsp>>ReceiveCOrder.jsp>>COrder2.jsp>>OrderCost.jsp>>Cust_Order_Payment.jsp>>Cust_Order_table.jsp
        2.LoginSuccess.jsp>>Table_COrder.jsp
        
  ####Same procee goes for Retailer SIgnup,Login and adding Retailer_Product_Details.
