package tema3;

import java.text.DecimalFormat;

public class Balanza {
    private float monto;
    private int cantItems;
    private float precioPorKg;
    private float pesoEnKg;
    
    //Metodos
    public void iniciarCompra(){
        monto=0;
        cantItems=0;
    }
    public void registrarProducto(float pesoEnKg, float precioPorKg){
        float peso=pesoEnKg;
        float precio=precioPorKg;
        float importe=precioPorKg*pesoEnKg;
        monto+=importe;
        cantItems++;
    }
    public float devolverMontoAPagar(){
        return monto;
    }
    public String devolverResumenDeCompra(){
        DecimalFormat formato = new DecimalFormat("#.00");
        return "Total a pagar $"+formato.format(monto)+" ARS por la compra de "+cantItems+" productos.";
    }
}