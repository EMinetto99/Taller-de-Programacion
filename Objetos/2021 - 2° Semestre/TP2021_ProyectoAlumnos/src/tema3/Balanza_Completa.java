package tema3;

import java.text.DecimalFormat;

public class Balanza_Completa {
    private float monto;
    private int cantItems;
    private float precioPorKg;
    private float pesoEnKg;
    private String resumen;
    
    //Metodos
    public void iniciarCompra(){
        monto=0;
        cantItems=0;
        resumen="";
    }
    public void registrarProducto(Producto info_Producto, double precioPorKg){
        DecimalFormat formato = new DecimalFormat("#.00");
        float peso=(float)info_Producto.getPesoEnKg();
        float precio=(float)precioPorKg;
        float importe=peso*precio;
        monto+=importe;
        cantItems++;
        resumen+=info_Producto.getDescripcion()+" $"+formato.format(importe)+" ARS - ";
    }
    public float devolverMontoAPagar(){
        return monto;
    }
    public String devolverResumenDeCompra(){
        DecimalFormat formato = new DecimalFormat("#.00");
        return resumen+"\nTotal a pagar $"+formato.format(monto)+" ARS por la compra de "+cantItems+" productos.";
    }
}