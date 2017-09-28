package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO - FIDES
 * @author BlueFox - SD
 */
public class Usuariopokemon implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long usuario_id;
    private long pokemon_id;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Usuariopokemon() {
    }
    public Usuariopokemon(long usuario_id) {
        this.usuario_id = usuario_id;
    }
    public Usuariopokemon(long usuario_id , int access_id) {
        this.usuario_id = usuario_id;
        this.access_id = access_id;
    }
    public Usuariopokemon(long usuario_id, long pokemon_id) {
        this.usuario_id = usuario_id;
        this.pokemon_id = pokemon_id;
            
    }

    @Override
    public String toString() {
    return "Usuariopokemon{" +"long=" + usuario_id +", "+"long=" + pokemon_id + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblusuariopokemon", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblusuariopokemon", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblusuariopokemon", this);
    }
    
    public static ArrayList<Usuariopokemon> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblusuariopokemon","",limit,new Usuariopokemon());
        else
            return DAO_PA.getTableDAO("public.tblusuariopokemon","2 desc ",limit,new Usuariopokemon());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getusuario_id() {
        return usuario_id;
    }

    public void setusuario_id(long usuario_id) {
        this.usuario_id = usuario_id;
    }
      
    public long getpokemon_id() {
        return pokemon_id;
    }

    public void setpokemon_id(long pokemon_id) {
        this.pokemon_id = pokemon_id;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Usuariopokemon> filldao(ResultSet rs) throws SQLException {
        ArrayList<Usuariopokemon> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Usuariopokemon(rs.getLong(1), rs.getLong(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Usuariopokemon> filler(ResultSet rs) throws SQLException {
        ArrayList<Usuariopokemon> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Usuariopokemon(rs.getLong(1), rs.getLong(2)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

