/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.others;

import bangmaple.models.RequestDAO;

/**
 *
 * @author bangmaple
 */
public class BackgroundJob implements Runnable {
    private final RequestDAO dao = new RequestDAO();
    
    @Override
    public void run() {
        dao.removeOutdateRequest();
    }
    
}
