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

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve product details from request parameters
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            int productInventory = Integer.parseInt(request.getParameter("quantity"));

            // Open session and start transaction
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // Get the product to be updated
            Product product = session.get(Product.class, productId);

            // Update the product details
        
            product.setProductInventory(productInventory);

            // Update the product in the database
            session.merge(product);

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
