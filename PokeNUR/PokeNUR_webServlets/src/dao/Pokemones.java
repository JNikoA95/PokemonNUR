package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author NIKOLAS-PC
 */
public class Pokemones implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long codigo_id;
    private String nombre;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Pokemones() {
    }
    public Pokemones(long codigo_id) {
        this.codigo_id = codigo_id;
    }
    public Pokemones(long codigo_id , int access_id) {
        this.codigo_id = codigo_id;
        this.access_id = access_id;
    }
    public Pokemones(long codigo_id, String nombre) {
        this.codigo_id = codigo_id;
        this.nombre = nombre;
            
    }

    @Override
    public String toString() {
    return "Pokemones{" +"long=" + codigo_id +", "+"String=" + nombre + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblpokemones", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblpokemones", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblpokemones", this);
    }
    
    public static ArrayList<Pokemones> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblpokemones","",limit,new Pokemones());
        else
            return DAO_PA.getTableDAO("public.tblpokemones","2 desc ",limit,new Pokemones());        
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
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Pokemones> filldao(ResultSet rs) throws SQLException {
        ArrayList<Pokemones> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Pokemones(rs.getLong(1), rs.getString(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Pokemones> filler(ResultSet rs) throws SQLException {
        ArrayList<Pokemones> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Pokemones(rs.getLong(1), rs.getString(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

