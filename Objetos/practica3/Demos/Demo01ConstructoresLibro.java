/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3.Demos;

import tema3.Autor;
import tema3.Libro;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor aut = new Autor("Pepito Mengano", "Un buen chabon", "Amsterdam");
        Autor aut1 = new Autor("Jorgelio Papas", "Escritor con mucho detalle", "Chekoslovakia");
        
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 aut, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               aut1, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
        System.out.println(libro1.toString(aut));
        System.out.println(libro2.toString(aut1));
    }
    
}
