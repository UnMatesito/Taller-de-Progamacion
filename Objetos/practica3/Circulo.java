/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author samsungII
 */
public class Circulo {
   private double radio;
   private String colorRelleno;
   private String colorLinea;
   
   public Circulo(){
       
   }
   
   public Circulo(double unRadio, String unRelleno, String unColor){
       radio = unRadio;
       colorRelleno = unRelleno;
       colorLinea = unColor;
   }
   
   public void setRadio(double unRadio){
       radio = unRadio;
   }
   
   public void setRelleno(String unRelleno){
       colorRelleno = unRelleno;
   }
   
   public void setLinea(String unColor){
       colorLinea = unColor;
   }
   
   public double getRadio(){
       return radio;
   }
   
   public String getRelleno(){
       return colorRelleno;
   }
   
   public String getLinea(){
       return colorLinea;
   }
   
   public double calcularPerimetro(){
       return 2*Math.PI*radio;
   }
   
   public double calcularArea(){
       return Math.PI*(radio*radio);
   }
}
