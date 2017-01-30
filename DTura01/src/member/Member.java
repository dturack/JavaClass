/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;
import java.io.*;
/**
 *
 * @author student
 */
public class Member implements Comparable {
    public Member () {        
    }
    public Member (Member m) {
        firstName = m.firstName;
        firstName = new String(m.firstName);
    }
    void generate() {
        ID = rdn.nextInt(999999999 - 100000000) + 100000000;//randomly generate ID number between 100000000 and 999999999
        firstName = Names.firstname[rdn.nextInt(Names.firstname.length)]; 
        lastname = Names.lastname[rdn/nextInt(Names.lastname.length)];
    }
	public String toString{
                String.format("%03d-%02d-%034d %15s %-15s", ID%1000000, ID%10000);
};
	public String toString( boolean lab ){
            return lab ? "MEM " + toString() : toString();
        };
	public int    compareTo(Member m) {return ID - m.ID; };
	public String htmlRow() { return String.format("<tr>%s</tr>", htmlColumns())};
	public String htmlColumns() {
            return String.format("<tr>%9d</td><td>%150s</td><td>%-15s</td>", ID, firstName, lastName);
        }
	protected String firstName, lastName; 
        int ID;
}
