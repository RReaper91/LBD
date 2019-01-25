/*
 * UsaLookup.java
 *
 * Modified on 2013-06-02
 */
package social_network;

/**
 * Interfaccia delle componenti che possono usare form di ricerca.
 * 
 * @author Berezyuk Alina N86/618
 * @author Di Lucrezia Roberto N86/659
 * 
 */
public interface UsaLookup {
   /**
    * Imposta una propriet&agrave; del componente padre.
    * 
    * @param proprieta stringa con il nome della propriet&agrave;
    * @param valore stringa con il valore associato
    */
   public void setProprietaPadre(String proprieta, String valore);
}
