/*
 * Database.java
 * 
 */
package social_network;

import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

/**
 * Classe principale di connessione al database.
 *
 * @author Berezyuk Alina N86/618
 * @author Di Lucrezia Roberto N86/659
 *
 */
public class Database {

   static public String host = "localhost";
   static public String servizio = "xe";
   static public int porta = 1521;
   static public String user = "";
   static public String password = "";
   static public String schema = "auto";
   static private OracleDataSource ods;
   static private Connection defaultConnection;

   /**
    * Restituisce la connessione di default al DB.
    * 
    * @return Connection al database
    * @throws SQLException in caso di errore di connessione
    */
   static public Connection getDefaultConnection() throws SQLException {
      if (defaultConnection == null || defaultConnection.isClosed()) {
         defaultConnection = nuovaConnessione();
         System.out.println("nuova connessione");   //debug
      } else {
         System.out.println("ricicla connessione"); //debug
      }

      return defaultConnection;
   }

   /**
    * Imposta la connessione di default al DB.
    * 
    * @param c la Connection da impostare come default
    */
   static public void setDefaultConnection(Connection c) {
      defaultConnection = c;
   }

   /**
    * Restituisce una nuova connessione al DB.
    * 
    * @return la nuova Connection
    * @throws SQLException in caso di errore di connessione
    */
   static public Connection nuovaConnessione() throws SQLException {
      ods = new OracleDataSource();
      ods.setDriverType("thin");
      ods.setServerName(host);
      ods.setPortNumber(porta);
      ods.setUser(user);
      ods.setPassword(password);
      ods.setDatabaseName(servizio);
      return ods.getConnection();
   }

   /**
    * Effettua una query e restituisce il primo valore.
    * 
    * @param query String contenente l'interrogazione
    * @return oggetto contenente la prima colonna della prima riga del risultato
    */
   static public Object leggiValore(String query) {
      Object ret;
      Connection con;
      Statement st;
      ResultSet rs;
      ret = null;
      try {
         con = getDefaultConnection();
         st = con.createStatement();
         rs = st.executeQuery(query);
         rs.next();
         ret = rs.getObject(1);
      } catch (SQLException e) {  //nessuna azione
      }
      return ret;
   }

   /**
    * Effettua una query e restituisce il primo valore.
    * 
    * @param query String contenente l'interrogazione con segnaposto
    * @param codice int per rimpiazzare il segnaposto
    * @return oggetto contenente la prima colonna della prima riga del risultato
    */
   static public Object leggiValore(String query, int codice) {
      Object ret;
      Connection con;
      PreparedStatement st;
      ResultSet rs;
      ret = null;
      System.out.println(query + codice); //debug
      try {
         con = getDefaultConnection();
         st = con.prepareStatement(query);
         st.setInt(1, codice);
         rs = st.executeQuery();
         rs.next();
         ret = rs.getObject(1);
      } catch (SQLException e) {
      }
      return ret;
   }
}
