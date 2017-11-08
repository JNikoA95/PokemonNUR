using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class AtaquesBRL
{
    public AtaquesBRL()
    {}

    public static List<Ataque> getAtaquesByTipo(int id)
    {
        AtaqueDSTableAdapters.AtaquesByTipoTableAdapter adapter = new AtaqueDSTableAdapters.AtaquesByTipoTableAdapter();
        AtaqueDS.AtaquesByTipoDataTable table = adapter.GetAtaquesByTipo(id);
        List<Ataque> lista = new List<Ataque>();

        foreach (AtaqueDS.AtaquesByTipoRow row in table)
        {
            lista.Add(RowToDto(row));
        }

        return lista;
    }

    private static Ataque RowToDto(AtaqueDS.AtaquesByTipoRow row)
    {
        Ataque objAtaque = new Ataque
        {
            Codigo_id = row.codigo_id,
            Nombre = row.nombre,
            PoderAtaque = row.poderAtaque,
            Tipo_id = row.tipo_id
        };

        return objAtaque;
    }
}