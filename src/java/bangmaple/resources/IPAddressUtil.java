/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.resources;

import java.io.IOException;
import java.io.Serializable;
import java.net.InetSocketAddress;
import java.net.Socket;

/**
 *
 * @author bangmaple
 */
public final class IPAddressUtil implements Serializable {
	public static final String getCurrentIPv4Address() throws IOException{
		Socket socket = new Socket();
		socket.connect(new InetSocketAddress("google.com", 80));
		return socket.getLocalAddress().toString().replaceAll("/", "");
	}
}
