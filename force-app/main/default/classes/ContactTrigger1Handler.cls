public class ContactTrigger1Handler
{
  

  public static Void RunTrigger(List<contact> NewList)
    {
        if(trigger.isinsert && trigger.Isbefore)
        {
            checktheDuplicatescontact(NewList);
        }
    }

   Public static void checktheDuplicatescontact(List<Contact>  NewList)
   {  List<string> phone=new List<string>();
      List<string>  Email=new list<string>();
      for(Contact cnt:[select Id,Email,Phone from contact])
      {
          phone.add(cnt.Phone);
          Email.add(cnt.Email);
      }
      for(Contact cnttt:NewList)
      {
        if(phone.contains(cnttt.phone) && Email.contains(cnttt.Email))
          cnttt.addError('Duplicates exist');
      }

    }
}