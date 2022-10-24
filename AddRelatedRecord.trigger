// For Trailhead module: 
// https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_intro

// First, the original version:(Commented out)
/*
trigger AddRelatedRecord on Account (after insert, after update) {

    List <Opportunity> oppList = new List <Opportunity>();
    // Get the related opportunities for the accounts in this trigger

Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
    [SELECT Id, (SELECT Id FROM Opportunities)
    FROM Account WHERE Id in :Trigger.new WITH SECURITY_ENFORCED]);

    // Add an opportunity for each account if it doesn't already have one
    // Iterate through each Account

    for (Account a : Trigger.new){
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        // Check if the Account already has a related Oppty

        if (acctsWithOpps.get(a.Id).Opportunities.size() == 0){
            // If it doesn't, add a default Oppty

            oppList.add(new Opportunity (Name=a.Name + ' Opportunity',
                                         StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId=a.Id));      
        }
    }

    if (oppList.size() > 0){
        insert oppList;
    }

}
*/

// Next, the new version for Bulk Apex Trigger Module:
// https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_bulk

trigger AddRleatedRecord on Account (after insert, after update){
    List<Opportunity> oppList = new List<Opportunity> ();
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate over accounts that are in this trigger but that don't have opportunities
    
    List<Account> toProcess = null;
    switch on Trigger.operationType {
        when AFTER_INSERT {
        // All inserted Accounts will need the Opportunity, so there is no need to perform the query
            toProcess = Trigger.new;        
        }
        when AFTER_UPDATE {
            toProcess = [SELECT Id, Name 
                        FROM Account 
                        WHERE Id IN :Trigger.new
                        AND Id NOT IN 
                        (SELECT AccountId FROM Opportunity 
                        WHERE AccountId IN :Trigger.new WITH SECURITY_ENFORCED)];
        }
    }

    for (Account a : toProcess){
        // Add a default opportunity for this account

        oppList.add(new Opportunity (
            Name      = a.Name + 'Opportunity',
            StageName = 'Prospecting',
            CloseDate = today().addMonths(1),
            AccountId = a.Id));
    }

    if (oppList.size() >0){
        insert oppList;
    }
}
