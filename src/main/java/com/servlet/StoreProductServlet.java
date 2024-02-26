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

@WebServlet("/storeProductServlet")
public class StoreProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StoreProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve product details from request parameters
            String productName = request.getParameter("productName");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int productInventory = Integer.parseInt(request.getParameter("quantity"));

            // Create a new Product object
            Product product = new Product(productName, productPrice, productInventory);

            // Open session and start transaction
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // Save the product in the database
            session.persist(product);

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
