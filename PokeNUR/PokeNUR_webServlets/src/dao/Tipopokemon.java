package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author NIKOLAS-PC
 */
public class Tipopokemon implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long pokemon_id;
    private long tipo_id;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Tipopokemon() {
    }
    public Tipopokemon(long pokemon_id) {
        this.pokemon_id = pokemon_id;
    }
    public Tipopokemon(long pokemon_id , int access_id) {
        this.pokemon_id = pokemon_id;
        this.access_id = access_id;
    }
    public Tipopokemon(long pokemon_id, long tipo_id) {
        this.pokemon_id = pokemon_id;
        this.tipo_id = tipo_id;
            
    }

    @Override
    public String toString() {
    return "Tipopokemon{" +"long=" + pokemon_id +", "+"long=" + tipo_id + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tbltipopokemon", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tbltipopokemon", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tbltipopokemon", this);
    }
    
    public static ArrayList<Tipopokemon> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tbltipopokemon","",limit,new Tipopokemon());
        else
            return DAO_PA.getTableDAO("public.tbltipopokemon","2 desc ",limit,new Tipopokemon());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getpokemon_id() {
        return pokemon_id;
    }

    public void setpokemon_id(long pokemon_id) {
        this.pokemon_id = pokemon_id;
    }
      
    public long gettipo_id() {
        return tipo_id;
    }

    public void settipo_id(long tipo_id) {
        this.tipo_id = tipo_id;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Tipopokemon> filldao(ResultSet rs) throws SQLException {
        ArrayList<Tipopokemon> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Tipopokemon(rs.getLong(1), rs.getLong(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Tipopokemon> filler(ResultSet rs) throws SQLException {
        ArrayList<Tipopokemon> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Tipopokemon(rs.getLong(1), rs.getLong(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

