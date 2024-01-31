public class AccountNewPageController {
    public Account acc{set;get;}
    public AccountNewPageController(Apexpages.StandardController controller){
        acc = (Account)controller.getRecord();
    }
    
    public PageReference save(){
        Integer count =[Select count() from Account where name=:acc.name];
        if(count>0){
            Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR,'Duplicate records exists!');
            Apexpages.addMessage(msg);
            return null;
        }else{
            insert acc;
            PageReference p = new PageReference('/'+acc.id);
            return p;
        }
        
    }
}