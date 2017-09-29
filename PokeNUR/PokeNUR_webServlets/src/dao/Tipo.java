package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author NIKOLAS-PC
 */
public class Tipo implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long codigo_id;
    private String nombretipo;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Tipo() {
    }
    public Tipo(long codigo_id) {
        this.codigo_id = codigo_id;
    }
    public Tipo(long codigo_id , int access_id) {
        this.codigo_id = codigo_id;
        this.access_id = access_id;
    }
    public Tipo(long codigo_id, String nombretipo) {
        this.codigo_id = codigo_id;
        this.nombretipo = nombretipo;
            
    }

    @Override
    public String toString() {
    return "Tipo{" +"long=" + codigo_id +", "+"String=" + nombretipo + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tbltipo", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tbltipo", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tbltipo", this);
    }
    
    public static ArrayList<Tipo> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tbltipo","",limit,new Tipo());
        else
            return DAO_PA.getTableDAO("public.tbltipo","2 desc ",limit,new Tipo());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getcodigo_id() {
        return codigo_id;
    }

    public void setcodigo_id(long codigo_id) {
        this.codigo_id = codigo_id;
    }
      
    public String getnombretipo() {
        return nombretipo;
    }

    public void setnombretipo(String nombretipo) {
        this.nombretipo = nombretipo;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Tipo> filldao(ResultSet rs) throws SQLException {
        ArrayList<Tipo> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Tipo(rs.getLong(1), rs.getString(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Tipo> filler(ResultSet rs) throws SQLException {
        ArrayList<Tipo> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Tipo(rs.getLong(1), rs.getString(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

