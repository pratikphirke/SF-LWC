trigger ContactTrg on Contact (before update)
{
    ContactTrgUtils.SetApprover(trigger.new, trigger.isUpdate, trigger.isInsert, trigger.isDelete, trigger.isAfter);
}