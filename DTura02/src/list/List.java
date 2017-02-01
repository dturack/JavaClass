/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package list;

/**
 *
 * @author student
 */
public class List<T> {

    
    protected class Node {
        protected Node next, previous;
        T data;
        public Node( T data ) {
            next = previous = null;
            this.data = data;
        }
    }
    
    protected Node front, rear ;
    protected int size =0;
    
    public List() {front = rear = null;}
    
    public int size() { return size; }
    public boolean empty() { return size < 1; }

    public List<T> addToFront( T v ){
        Node nn = new Node( v );
        
        if ( front != null ) front.previous = nn;
        else rear = nn;
        nn.next = front;
        front = nn;
        size ++;
        return this;
    }
    
    public List<T> addToRear( T v ){
        Node nn = new Node( v );
        
        if ( rear != null ) {
            rear.next = null;
        }
        else 
            front = nn;
        rear.next = nn;
        nn.previous = rear;
        rear = nn;
        size ++;
        return this;
    }
    
    public List<T> add ( T v, int pos ) {
        //Adjust position if necessary
        pos = pos < 0 ? 0 : pos > size ? size : pos;
        
        if ( pos==0) return addToFront( v );
        if ( pos==size) return addToRear( v );
        
        Node cur = front;
        for (int i = 1; i< pos; i++) cur = cur.next;
        
        //New node will be append to current node.
        Node nn = new Node( v );
        nn.next = cur.next;
        nn.previous = cur;
        cur.next = nn.next.previous = nn;
        size++;
        return this;
    }
    
    protected class ListIterator implements Iterator<T>{
        
    }
    
}
