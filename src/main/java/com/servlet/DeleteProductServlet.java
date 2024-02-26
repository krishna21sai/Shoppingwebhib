package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.FactoryProvider;
import com.model.Product;

import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet("/deleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve product ID from request parameter
            int productId = Integer.parseInt(request.getParameter("id"));

            // Open session and start transaction
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // Get the product to be deleted
            Product product = session.get(Product.class, productId);

            // Delete the product from the database
            session.remove(product);

            // Commit the transaction
            transaction.commit();
            session.close();

            response.sendRedirect("ViewCart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
