package servlets;

import com.google.gson.Gson;
import dao.Pokemones;
import utils.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author BlueFox - SD
 */
@WebServlet(name = "SvPokemones", urlPatterns = {"/pokemones"})
public class SvPokemones extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ArrayList<Pokemones> pokemones = null;
        try {
            conexion.Conexion.autoConnect();
            pokemones = Pokemones.getRecords(0);
        } catch (SQLException ex) {
            Logger.getLogger(SvPokemones.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_REQUEST_TIMEOUT);
        }

        PrintWriter out = response.getWriter();
        try {
            out.print(new Gson().toJson(pokemones));
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            if (request.getParameter("make") != null) {
                String json = request.getParameter("make");
                UserManager usr=(UserManager) request.getSession().getAttribute("SessionData");
                System.out.println(json);
                Pokemones pokemones = new Gson().fromJson(json, Pokemones.class);
                pokemones .setaccess_id(usr.getCodigo_id());
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                try {
                    out.print(pokemones.insert());
                } catch (SQLException ex) {
                    Logger.getLogger(SvPokemones.class.getName()).log(Level.SEVERE, null, ex);
                } finally {
                    out.close();
                }            
            } else if (request.getParameter("del") != null) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                try {
                    UserManager usr=(UserManager) request.getSession().getAttribute("SessionData");
                    out.print(new Pokemones(Integer.parseInt(request.getParameter("del").trim()),usr.getCodigo_id()).delete());
                    } catch (SQLException ex) {
                      Logger.getLogger(SvPokemones.class.getName()).log(Level.SEVERE, null, ex);
                } finally {
                    out.close();
                }

            } else {
                processRequest(request, response);
            }
        }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

