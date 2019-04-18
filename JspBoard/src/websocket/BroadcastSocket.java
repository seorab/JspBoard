package websocket;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.InetSocketAddress;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Async;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class BroadcastSocket {
	private static Set<Session> clients = new HashSet<Session>();
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        String msg = "{\"msg\":\"" + message + "\"}";
        if(message.startsWith("@귓속말@")) {
        	
        }
        	
        System.out.println(message);
        System.out.println(msg);
        
        for(Session client : clients) {
            client.getBasicRemote().sendText(msg);
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }
}