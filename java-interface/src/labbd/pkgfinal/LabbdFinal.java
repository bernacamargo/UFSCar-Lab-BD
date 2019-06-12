/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package labbd.pkgfinal;

/**
 *
 * @author Bernardo Camargo
 */
public class LabbdFinal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Conn conn = new Conn();
        
        conn.Conectar();
        
        TelaPrincipal tela = new TelaPrincipal();
        
        tela.setVisible(true);
    }
    
}
