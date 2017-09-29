package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author NIKOLAS-PC
 */
 public class Usuarios implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long codigo_id;
    private String username;
    private String contraseña;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Usuarios() {
    }
    public Usuarios(long codigo_id) {
        this.codigo_id = codigo_id;
    }
    public Usuarios(long codigo_id , int access_id) {
        this.codigo_id = codigo_id;
        this.access_id = access_id;
    }
    public Usuarios(long codigo_id, String username, String contraseña) {
        this.codigo_id = codigo_id;
        this.username = username;
        this.contraseña = contraseña;
            
    }

    @Override
    public String toString() {
    return "Usuarios{" +"long=" + codigo_id +", "+"String=" + username +", "+"String=" + contraseña + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblusuarios", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblusuarios", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblusuarios", this);
    }
    
    public static ArrayList<Usuarios> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblusuarios","",limit,new Usuarios());
        else
            return DAO_PA.getTableDAO("public.tblusuarios","2 desc ",limit,new Usuarios());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getcodigo_id() {
        return codigo_id;
    }

    public void setcodigo_id(long codigo_id) {
        this.codigo_id = codigo_id;
    }
      
    public String getusername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
    }
      
    public String getcontraseña() {
        return contraseña;
    }

    public void setcontraseña(String contraseña) {
        this.contraseña = contraseña;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Usuarios> filldao(ResultSet rs) throws SQLException {
        ArrayList<Usuarios> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Usuarios(rs.getLong(1), rs.getString(2), rs.getString(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Usuarios> filler(ResultSet rs) throws SQLException {
        ArrayList<Usuarios> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Usuarios(rs.getLong(1), rs.getString(2), rs.getString(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

