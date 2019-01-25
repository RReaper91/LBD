/*
 * MainProf.java
 *
 */
package social_network;

/**
 * Frame principale.
 *
 * @author Berezyuk Alina N86/618
 * @author Di Lucrezia Roberto N86/659
 *
 */
public class MainProf extends javax.swing.JFrame {

   /**
    * Creates new form MainProf.
    */
   public MainProf() {
      initComponents();
      Login l;
      l = new Login(this, true);
      l.setVisible(true);
      if (l.getBottonePremuto() == Login.PREMUTO_ANNULLA) {
         dispose();
      } else {
         setVisible(true);
      }
   }

   /**
    * This method is called from within the constructor to initialize the form.
    * WARNING: Do NOT modify this code. The content of this method is always
    * regenerated by the Form Editor.
    */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jToolBar = new javax.swing.JToolBar();
        bMarca = new javax.swing.JButton();
        bModello = new javax.swing.JButton();
        bAllestimento = new javax.swing.JButton();
        bCarateristica = new javax.swing.JButton();
        jMenuBar = new javax.swing.JMenuBar();
        menFile = new javax.swing.JMenu();
        miLogin = new javax.swing.JMenuItem();
        miEsci = new javax.swing.JMenuItem();
        menFunzioni = new javax.swing.JMenu();
        miMarca = new javax.swing.JMenuItem();
        miModello = new javax.swing.JMenuItem();
        miAllestimento = new javax.swing.JMenuItem();
        miCaratteristica = new javax.swing.JMenuItem();
        menAiuto = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Laboratorio di basi di dati");

        bMarca.setText("Marca");
        bMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bMarcaActionPerformed(evt);
            }
        });
        jToolBar.add(bMarca);

        bModello.setText("Modello");
        bModello.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bModelloActionPerformed(evt);
            }
        });
        jToolBar.add(bModello);

        bAllestimento.setText("Allestimento");
        bAllestimento.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bAllestimentoActionPerformed(evt);
            }
        });
        jToolBar.add(bAllestimento);

        bCarateristica.setText("Caratteristica");
        bCarateristica.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bCarateristicaActionPerformed(evt);
            }
        });
        jToolBar.add(bCarateristica);

        menFile.setText("File");

        miLogin.setText("Login");
        miLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miLoginActionPerformed(evt);
            }
        });
        menFile.add(miLogin);

        miEsci.setText("Esci");
        miEsci.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miEsciActionPerformed(evt);
            }
        });
        menFile.add(miEsci);

        jMenuBar.add(menFile);

        menFunzioni.setText("Funzioni");

        miMarca.setText("Marca");
        miMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miMarcaActionPerformed(evt);
            }
        });
        menFunzioni.add(miMarca);

        miModello.setText("Modello");
        miModello.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miModelloActionPerformed(evt);
            }
        });
        menFunzioni.add(miModello);

        miAllestimento.setText("Allestimento");
        miAllestimento.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miAllestimentoActionPerformed(evt);
            }
        });
        menFunzioni.add(miAllestimento);

        miCaratteristica.setText("Caratteristica");
        miCaratteristica.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miCaratteristicaActionPerformed(evt);
            }
        });
        menFunzioni.add(miCaratteristica);

        jMenuBar.add(menFunzioni);

        menAiuto.setMnemonic('1');
        menAiuto.setText("Aiuto");
        jMenuBar.add(menAiuto);

        setJMenuBar(jMenuBar);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jToolBar, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(104, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jToolBar, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 25, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void miCaratteristicaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miCaratteristicaActionPerformed
       //caratteristica();
    }//GEN-LAST:event_miCaratteristicaActionPerformed

    private void bCarateristicaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bCarateristicaActionPerformed
       //caratteristica();
    }//GEN-LAST:event_bCarateristicaActionPerformed

    private void miEsciActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miEsciActionPerformed
       dispose();
    }//GEN-LAST:event_miEsciActionPerformed

    private void miAllestimentoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miAllestimentoActionPerformed
       //allestimento();
    }//GEN-LAST:event_miAllestimentoActionPerformed

    private void bAllestimentoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bAllestimentoActionPerformed
       //allestimento();
    }//GEN-LAST:event_bAllestimentoActionPerformed

    private void miLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miLoginActionPerformed
       Login l;
       l = new Login(this, true);
       l.setVisible(true);
       if (l.getBottonePremuto() == Login.PREMUTO_ANNULLA) {
          dispose();
       }
    }//GEN-LAST:event_miLoginActionPerformed

    private void bModelloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bModelloActionPerformed
       //modello();
    }//GEN-LAST:event_bModelloActionPerformed

    private void bMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bMarcaActionPerformed
       //marca();
    }//GEN-LAST:event_bMarcaActionPerformed

    private void miModelloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miModelloActionPerformed
       //modello();
    }//GEN-LAST:event_miModelloActionPerformed

    private void miMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miMarcaActionPerformed
       //marca();
    }//GEN-LAST:event_miMarcaActionPerformed

   /*private void allestimento() {
      Allestimento m;
      m = new Allestimento();
      m.setVisible(true);
   }

   private void modello() {
      Modello m;
      m = new Modello();
      m.setVisible(true);
   }

   private void marca() {
      Marca m;
      m = new Marca();
      m.setVisible(true);
   }

   private void caratteristica() {
      Caratteristica m;
      m = new Caratteristica();
      m.setVisible(true);
   }*/

   /**
    * Lancia il thread principale (event dispatching), richiamando il
    * costruttore della classe.
    * 
    * @param args the command line arguments
    */
   /*public static void main(String args[]) {
      java.awt.EventQueue.invokeLater(new Runnable() {

         public void run() {
            MainProf p = new MainProf();
         }
      });
   }*/
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton bAllestimento;
    private javax.swing.JButton bCarateristica;
    private javax.swing.JButton bMarca;
    private javax.swing.JButton bModello;
    private javax.swing.JMenuBar jMenuBar;
    private javax.swing.JToolBar jToolBar;
    private javax.swing.JMenu menAiuto;
    private javax.swing.JMenu menFile;
    private javax.swing.JMenu menFunzioni;
    private javax.swing.JMenuItem miAllestimento;
    private javax.swing.JMenuItem miCaratteristica;
    private javax.swing.JMenuItem miEsci;
    private javax.swing.JMenuItem miLogin;
    private javax.swing.JMenuItem miMarca;
    private javax.swing.JMenuItem miModello;
    // End of variables declaration//GEN-END:variables
}
