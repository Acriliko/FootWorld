package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Punto unico di accesso al database.
 *
 * Le connessioni vengono prese dal pool (DataSource) configurato da Tomcat nel file
 * META-INF/context.xml con il nome JNDI "jdbc/FootWorld", lo stesso dichiarato in WEB-INF/web.xml.
 * Le credenziali del database si trovano quindi in un solo posto (context.xml).
 *
 * Ogni connessione restituita va chiusa dal chiamante (try-with-resources): la close()
 * non chiude la connessione fisica, ma la restituisce al pool.
 */
public final class DBConnection {

    private static final String JNDI_NAME = "java:comp/env/jdbc/FootWorld";

    private static DataSource dataSource;

    private DBConnection() {
    }

    private static synchronized DataSource getDataSource() throws SQLException {
        if (dataSource == null) {
            try {
                Context initialContext = new InitialContext();
                dataSource = (DataSource) initialContext.lookup(JNDI_NAME);
            } catch (NamingException e) {
                throw new SQLException("DataSource '" + JNDI_NAME + "' non trovato: "
                        + "controllare META-INF/context.xml e WEB-INF/web.xml", e);
            }
        }
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return getDataSource().getConnection();
    }
}
