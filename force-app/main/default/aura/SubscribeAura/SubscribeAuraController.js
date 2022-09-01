({
    toggleSubscribe : function(component, event, helper) {
        component.set("v.isSubscribed", event.getSource().get("v.checked"));
    },
    
    subscribeHandler : function(component, event, helper) {
        if(component.get("v.isSubscribed")){
            // Use event object to get the parameters.
            if (event != null && event.getParam("publishedText") != null) {
                component.set("v.retrievedMessage", event.getParam("publishedText"));
            }
        }
    }
})