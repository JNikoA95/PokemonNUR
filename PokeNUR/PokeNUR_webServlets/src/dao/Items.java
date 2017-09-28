package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO - FIDES
 * @author BlueFox - SD
 */
public class Items implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long codigo_id;
    private String nombreitem;
    private long precio;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Items() {
    }
    public Items(long codigo_id) {
        this.codigo_id = codigo_id;
    }
    public Items(long codigo_id , int access_id) {
        this.codigo_id = codigo_id;
        this.access_id = access_id;
    }
    public Items(long codigo_id, String nombreitem, long precio) {
        this.codigo_id = codigo_id;
        this.nombreitem = nombreitem;
        this.precio = precio;
            
    }

    @Override
    public String toString() {
    return "Items{" +"long=" + codigo_id +", "+"String=" + nombreitem +", "+"long=" + precio + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblitems", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblitems", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblitems", this);
    }
    
    public static ArrayList<Items> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblitems","",limit,new Items());
        else
            return DAO_PA.getTableDAO("public.tblitems","2 desc ",limit,new Items());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getcodigo_id() {
        return codigo_id;
    }

    public void setcodigo_id(long codigo_id) {
        this.codigo_id = codigo_id;
    }
      
    public String getnombreitem() {
        return nombreitem;
    }

    public void setnombreitem(String nombreitem) {
        this.nombreitem = nombreitem;
    }
      
    public long getprecio() {
        return precio;
    }

    public void setprecio(long precio) {
        this.precio = precio;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Items> filldao(ResultSet rs) throws SQLException {
        ArrayList<Items> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Items(rs.getLong(1), rs.getString(2), rs.getLong(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Items> filler(ResultSet rs) throws SQLException {
        ArrayList<Items> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Items(rs.getLong(1), rs.getString(2), rs.getLong(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

