package cn.abovesky.shopping.dwr;

import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContextFactory;

public class MessagePush {
    public void onPageLoad(String merchantId) {
        ScriptSession scriptSession = WebContextFactory.get().getScriptSession();
        scriptSession.setAttribute("merchantId", merchantId);
    }
}
