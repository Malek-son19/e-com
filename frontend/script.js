// API URL
const API_URL = 'http://localhost:5000/api';


async function fetchCustomers() {
    try {
        const response = await fetch(`${API_URL}/customers`);
        if (!response.ok) throw new Error('Failed to fetch customers');
        const customers = await response.json();
        displayCustomers(customers);
    } catch (error) {
        console.error('Error:', error);
        alert('Failed to load customers');
    }
}

//  display customers and their orders
function displayCustomers(customers) {
    const container = document.getElementById('customersContainer');
    container.innerHTML = '';

    customers.forEach(customer => {
        const customerElement = document.createElement('div');
        customerElement.className = 'customer-card';
        
        const ordersList = customer.orders.map(order => `
            <li class="product-item">
                ${order.product} - <span class="product-price">$${order.price}</span>
                <div class="order-date">Ordered: ${new Date(order.date).toLocaleDateString()}</div>
            </li>
        `).join('');

        customerElement.innerHTML = `
            <div class="customer-name">${customer.name}</div>
            <ul class="product-list">
                ${ordersList}
            </ul>
            <div class="total-spent">Total Spent: $${calculateTotal(customer.orders)}</div>
            <button class="delete-btn" onclick="deleteCustomer('${customer._id}')">Delete Customer</button>
        `;

        container.appendChild(customerElement);
    });
}

// Function to add new customer order
async function addCustomerOrder(name, product, price, date) {
    try {
        const response = await fetch(`${API_URL}/customers`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ name, product, price, date })
        });

        if (!response.ok) throw new Error('Failed to add order');
        fetchCustomers(); // Refresh the display
    } catch (error) {
        console.error('Error:', error);
        alert('Failed to add order');
    }
}

// Function to delete customer
async function deleteCustomer(id) {
    try {
        const response = await fetch(`${API_URL}/customers/${id}`, {
            method: 'DELETE'
        });

        if (!response.ok) throw new Error('Failed to delete customer');
        fetchCustomers(); // Refresh the display
    } catch (error) {
        console.error('Error:', error);
        alert('Failed to delete customer');
    }
}

//  calculate total spent by customer
function calculateTotal(orders) {
    return orders.reduce((total, order) => total + order.price, 0).toFixed(2);
}

// Form submission handler
document.getElementById('addCustomerForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    
    const name = document.getElementById('customerName').value;
    const product = document.getElementById('productName').value;
    const price = document.getElementById('productPrice').value;
    const date = document.getElementById('orderDate').value;
    
    await addCustomerOrder(name, product, price, date);
    
    // Reset form
    this.reset();
});

// Initial load of customers
fetchCustomers(); 