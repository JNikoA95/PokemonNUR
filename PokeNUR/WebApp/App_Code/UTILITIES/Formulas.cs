using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Formulas
/// </summary>
public class Formulas
{
    public Formulas()
    {

    }

    public static int NivelPokemon(int experiencia)
    {
        int nivelE = 50;
        int nivel = 1;

        while (experiencia >= nivelE + (nivelE * 0.5))
        {
            nivel++;
        }

        return nivel;
    }

    public static int VidaPokemon(int experiencia, int cantVida)
    {
        return cantVida + (int)(NivelPokemon(experiencia) * 1.5);
    }

    public static int DefensaPokemon(int experiencia)
    {
        return 35 + (int)(NivelPokemon(experiencia) * 1.5);
    }

    public static int ExperienciaPokemon(int experiencia)
    {
        return experiencia + (int)(NivelPokemon(experiencia) * 1.5);
    }

    public static int VariacionAtaque()
    {
        Random rnd = new Random();
        return rnd.Next(85, 100);
    }

    public static Double BonoAtaque(String tipoPokemon1, String tipoPokemon2)
    {
        double bono = 0;
        if (tipoPokemon1.Equals(tipoPokemon2))
        {
            bono = 1.5;
        }
        else
        {
            bono = 1;
        }
        return bono;

    }

    public static Double PoderAtaque(int ataque, int experiencia)
    {
        return ataque * 1.5 * NivelPokemon(experiencia);
    }

    public static int DineroGanado(int CantDineroOponente)
    {
        return (int)(CantDineroOponente * 0.1);
    }

    public static int DañoAtaque(int experiencia, String pokeLocal, String pokeVisita, int ataquePoke)
    {
        int daño = 0;
        daño = (int)(0.01 * BonoAtaque(pokeLocal, pokeVisita) * VariacionAtaque() *
            (((0.2 * (NivelPokemon(experiencia) + 1) * ataquePoke * PoderAtaque(ataquePoke, experiencia)) /
            (25 * DefensaPokemon(experiencia))) + 2));

        return daño;
    }


}