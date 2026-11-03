package control;

import model.User;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Filtro di accesso per l'area personale: serve essere loggati.
 * Se l'utente non ha una sessione con "currentSessionUser" viene mandato al login.
 */
@WebFilter(urlPatterns = {
        "/userPage/*",
        "/ChangeUserPasswordServlet"
})
public class UserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(false);
        User user = (session == null) ? null : (User) session.getAttribute("currentSessionUser");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/common/login.jsp");
            return;
        }

        chain.doFilter(req, resp);
    }
}
