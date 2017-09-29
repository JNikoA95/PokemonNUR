package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author NIKOLAS-PC
 */public class Batallas implements IDAO {
// <editor-fold defaultstate="collapsed" desc="Atributos"> 
    private long codigo_id;
    private long jugador1_id;
    private long jugador2_id;
    // </editor-fold> 
// <editor-fold defaultstate="collapsed" desc="Constructores + toString"> 
    public Batallas() {
    }
    public Batallas(long codigo_id) {
        this.codigo_id = codigo_id;
    }
    public Batallas(long codigo_id , int access_id) {
        this.codigo_id = codigo_id;
        this.access_id = access_id;
    }
    public Batallas(long codigo_id, long jugador1_id, long jugador2_id) {
        this.codigo_id = codigo_id;
        this.jugador1_id = jugador1_id;
        this.jugador2_id = jugador2_id;
            
    }

    @Override
    public String toString() {
    return "Batallas{" +"long=" + codigo_id +", "+"long=" + jugador1_id +", "+"long=" + jugador2_id + '}';
    }
    
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="CRUD">   
    @Override
    public long insert() throws SQLException {
        return DAO_PA.insertRecord("public.tblbatallas", this);
    }

    @Override
    public long update() throws SQLException {
        return DAO_PA.updateRecord("public.tblbatallas", this);
    }

    @Override
    public long delete() throws SQLException {
        return DAO_PA.deleteRecord("public.tblbatallas", this);
    }
    
    public static ArrayList<Batallas> getRecords(int limit) throws SQLException {
        if (limit==0)
            return DAO_PA.getTableDAO("public.tblbatallas","",limit,new Batallas());
        else
            return DAO_PA.getTableDAO("public.tblbatallas","2 desc ",limit,new Batallas());        
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Accessors">       
            
    public long getcodigo_id() {
        return codigo_id;
    }

    public void setcodigo_id(long codigo_id) {
        this.codigo_id = codigo_id;
    }
      
    public long getjugador1_id() {
        return jugador1_id;
    }

    public void setjugador1_id(long jugador1_id) {
        this.jugador1_id = jugador1_id;
    }
      
    public long getjugador2_id() {
        return jugador2_id;
    }

    public void setjugador2_id(long jugador2_id) {
        this.jugador2_id = jugador2_id;
    }
// </editor-fold>  
// <editor-fold defaultstate="collapsed" desc="Filler">       
    private static ArrayList<Batallas> filldao(ResultSet rs) throws SQLException {
        ArrayList<Batallas> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Batallas(rs.getLong(1), rs.getLong(2), rs.getLong(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
    public ArrayList<Batallas> filler(ResultSet rs) throws SQLException {
        ArrayList<Batallas> vec = new ArrayList<>();
        while (rs.next()) {
            vec.add(new Batallas(rs.getLong(1), rs.getLong(2), rs.getLong(3)));
        }
        rs.close();
        System.gc();
        return vec;
    }
// </editor-fold>      
}

