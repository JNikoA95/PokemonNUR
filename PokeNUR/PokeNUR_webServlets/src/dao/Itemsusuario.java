package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author NIKOLAS-PC
 */
public class Itemsusuario implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long usuario_id;
    private long item_id;
    private int cantidad;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Itemsusuario() {
    }
    public Itemsusuario(long usuario_id) {
        this.usuario_id = usuario_id;
    }
    public Itemsusuario(long usuario_id , int access_id) {
        this.usuario_id = usuario_id;
        this.access_id = access_id;
    }
    public Itemsusuario(long usuario_id, long item_id, int cantidad) {
        this.usuario_id = usuario_id;
        this.item_id = item_id;
        this.cantidad = cantidad;
            
    }

    @Override
    public String toString() {
    return "Itemsusuario{" +"long=" + usuario_id +", "+"long=" + item_id +", "+"int=" + cantidad + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblitemsusuario", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblitemsusuario", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblitemsusuario", this);
    }
    
    public static ArrayList<Itemsusuario> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblitemsusuario","",limit,new Itemsusuario());
        else
            return DAO_PA.getTableDAO("public.tblitemsusuario","2 desc ",limit,new Itemsusuario());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getusuario_id() {
        return usuario_id;
    }

    public void setusuario_id(long usuario_id) {
        this.usuario_id = usuario_id;
    }
      
    public long getitem_id() {
        return item_id;
    }

    public void setitem_id(long item_id) {
        this.item_id = item_id;
    }
      
    public int getcantidad() {
        return cantidad;
    }

    public void setcantidad(int cantidad) {
        this.cantidad = cantidad;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Itemsusuario> filldao(ResultSet rs) throws SQLException {
        ArrayList<Itemsusuario> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Itemsusuario(rs.getLong(1), rs.getLong(2), rs.getInt(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Itemsusuario> filler(ResultSet rs) throws SQLException {
        ArrayList<Itemsusuario> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Itemsusuario(rs.getLong(1), rs.getLong(2), rs.getInt(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

