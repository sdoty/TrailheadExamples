//https://trailhead.salesforce.com/content/learn/modules/apex_database/apex_database_dml

public class AccountHandler {
    public static Account insertNewAccount(String newAccountName){
        
        Account newAccount = new Account(Name = newAccountName);
        
        try{
        insert newAccount;
       
        }catch(Exception e)
        {
            return null;
        }
         return newAccount;
            }
                
      }
