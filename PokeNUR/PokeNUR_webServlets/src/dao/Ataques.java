package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO - FIDES
 * @author BlueFox - SD
 */
public class Ataques implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long codigo_id;
    private String nombre;
    private long tipo_id;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Ataques() {
    }
    public Ataques(long codigo_id) {
        this.codigo_id = codigo_id;
    }
    public Ataques(long codigo_id , int access_id) {
        this.codigo_id = codigo_id;
        this.access_id = access_id;
    }
    public Ataques(long codigo_id, String nombre, long tipo_id) {
        this.codigo_id = codigo_id;
        this.nombre = nombre;
        this.tipo_id = tipo_id;
            
    }

    @Override
    public String toString() {
    return "Ataques{" +"long=" + codigo_id +", "+"String=" + nombre +", "+"long=" + tipo_id + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblataques", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblataques", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblataques", this);
    }
    
    public static ArrayList<Ataques> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblataques","",limit,new Ataques());
        else
            return DAO_PA.getTableDAO("public.tblataques","2 desc ",limit,new Ataques());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getcodigo_id() {
        return codigo_id;
    }

    public void setcodigo_id(long codigo_id) {
        this.codigo_id = codigo_id;
    }
      
    public String getnombre() {
        return nombre;
    }

    public void setnombre(String nombre) {
        this.nombre = nombre;
    }
      
    public long gettipo_id() {
        return tipo_id;
    }

    public void settipo_id(long tipo_id) {
        this.tipo_id = tipo_id;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Ataques> filldao(ResultSet rs) throws SQLException {
        ArrayList<Ataques> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Ataques(rs.getLong(1), rs.getString(2), rs.getLong(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Ataques> filler(ResultSet rs) throws SQLException {
        ArrayList<Ataques> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Ataques(rs.getLong(1), rs.getString(2), rs.getLong(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

