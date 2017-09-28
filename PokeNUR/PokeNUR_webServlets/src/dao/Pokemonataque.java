package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO - FIDES
 * @author BlueFox - SD
 */
public class Pokemonataque implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long pokemon_id;
    private long ataque_id;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Pokemonataque() {
    }
    public Pokemonataque(long pokemon_id) {
        this.pokemon_id = pokemon_id;
    }
    public Pokemonataque(long pokemon_id , int access_id) {
        this.pokemon_id = pokemon_id;
        this.access_id = access_id;
    }
    public Pokemonataque(long pokemon_id, long ataque_id) {
        this.pokemon_id = pokemon_id;
        this.ataque_id = ataque_id;
            
    }

    @Override
    public String toString() {
    return "Pokemonataque{" +"long=" + pokemon_id +", "+"long=" + ataque_id + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblpokemonataque", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblpokemonataque", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblpokemonataque", this);
    }
    
    public static ArrayList<Pokemonataque> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblpokemonataque","",limit,new Pokemonataque());
        else
            return DAO_PA.getTableDAO("public.tblpokemonataque","2 desc ",limit,new Pokemonataque());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getpokemon_id() {
        return pokemon_id;
    }

    public void setpokemon_id(long pokemon_id) {
        this.pokemon_id = pokemon_id;
    }
      
    public long getataque_id() {
        return ataque_id;
    }

    public void setataque_id(long ataque_id) {
        this.ataque_id = ataque_id;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Pokemonataque> filldao(ResultSet rs) throws SQLException {
        ArrayList<Pokemonataque> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Pokemonataque(rs.getLong(1), rs.getLong(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Pokemonataque> filler(ResultSet rs) throws SQLException {
        ArrayList<Pokemonataque> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Pokemonataque(rs.getLong(1), rs.getLong(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

