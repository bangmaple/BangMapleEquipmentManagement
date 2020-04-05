/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.beans;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author bangmaple
 */
public class ResListBean implements Serializable {

    private int id;
    private Date date;
    private String title;

    public ResListBean() {
    }

    public Date getDate() {
        return date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSender() {
        return this.title.substring(0, this.title.lastIndexOf(":"));
    }

}
