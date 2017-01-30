/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

/**
 *
 * @author student
 */
public class Employee extends Member {
    public String htmlColumns() {
        return String.format("%s<td>%d</td><td>%s</td>", super.htmlColumns(), yearHired, dept);
    }
    
}
