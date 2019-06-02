public class EmailMissionSpecialist {
    // Public Method
    public void sendMail(String address, String subject, String body){
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] {mail});
        // Call a helper method to inspect the returned results
        inspectResults(results);
 }
 // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        //sendEmail returns and array of result objects.
        //Iterate through the list to inspect results
        //In this class, the methods send only one email,
        //so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occured: '+res.getErrors());
                
            }
            }
        return sendResult;
        }
       

    }

// Example for ExecuteAnonymous

EmailMissionSpecialist em = new EmailMissionSpecialist();
em.sendMail('shelleyldoty@gmail.com', 'Flight Path Change',
           'Mission Control 123: Your flight path has been changed to avoid collision '
           + 'with asteroid 2014 Q0441.');
    
// Example for adding contacts to the database

// Add first contact and related details
Contact contact1 = new Contact(
	Firstname= 'Quentin',
	Lastname= 'Foam',
	Phone= '(415)555-1212',
	Department= 'Specialty Crisis Management',
	Title= 'Control Engineer - Specialty - Solar Arrays',
	Email= 'gfoam@trailhead.com');
insert contact1;
// Add second contact and related details
Contact contact2 = new Contact(
   Firstname='Vega',
   Lastname='North',
   Phone='(416)556-1312',
   Department= 'Specialty Crisis Management',
   Title='Control Engineer - Specialty - Propulsion',
   Email='vnorth@trailhead.com');
insert contact2;
// Add third contact and related details
Contact contact3 = new Contact(
   Firstname='Palma',
   Lastname='Sunrise',
   Phone='(554)623-1212',
   Department= 'Specialty Crisis Management',
   Title='Control Engineer - Specialty - Radiators',
   Email='psunrise@trailhead.com');
insert contact3;

//SOQL Search
SELECT Name, Phone, Email, Title FROM Contact WHERE (Department = 'Specialty Crisis Management') LIMIT 10
	
// Inline SOQL search
Contact[] theseContacts = [SELECT Name, Phone, Email, Description FROM Contact WHERE (Department = 'Specialty Crisis Management') ORDER BY Name];
//Log a count of how many contacts were found
System.debug(theseContacts.size() +' contct(s) returned.');
//Log all values in the array of contacts
System.debug(theseContacts);

//SOSL search
FIND {Crisis} IN ALL FIELDS RETURNING Contact(Firstname, Lastname, Phone, Email, Title)
