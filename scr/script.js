// Sample initial data
let customers = [
    {
        id: 1,
        name: "John Doe",
        orders: [
            { product: "Laptop", price: 999.99, date: "2024-01-15" },
            { product: "Mouse", price: 29.99, date: "2024-01-15" }
        ]
    },
    {
        id: 2,
        name: "Jane Smith",
        orders: [
            { product: "Keyboard", price: 89.99, date: "2024-01-14" },
            { product: "Monitor", price: 299.99, date: "2024-01-14" }
        ]
    }
];

// Function to calculate total spent by customer
function calculateTotal(orders) {
    return orders.reduce((total, order) => total + order.price, 0).toFixed(2);
}

// Function to format date
function formatDate(dateString) {
    return new Date(dateString).toLocaleDateString();
}

// Function to display customers and their orders
function displayCustomers() {
    const container = document.getElementById('customersContainer');
    container.innerHTML = ''; // Clear current display

    customers.forEach(customer => {
        const customerElement = document.createElement('div');
        customerElement.className = 'customer-card';
        
        const ordersList = customer.orders.map(order => `
            <li class="product-item">
                ${order.product} - <span class="product-price">$${order.price}</span>
                <div class="order-date">Ordered: ${formatDate(order.date)}</div>
            </li>
        `).join('');

        customerElement.innerHTML = `
            <div class="customer-name">${customer.name}</div>
            <ul class="product-list">
                ${ordersList}
            </ul>
            <div class="total-spent">Total Spent: $${calculateTotal(customer.orders)}</div>
            <button class="delete-btn" onclick="deleteCustomer(${customer.id})">Delete Customer</button>
        `;

        container.appendChild(customerElement);
    });
}

// Function to add new customer order
function addCustomerOrder(name, product, price, date) {
    const existingCustomer = customers.find(c => c.name.toLowerCase() === name.toLowerCase());
    
    if (existingCustomer) {
        // Add order to existing customer
        existingCustomer.orders.push({
            product: product,
            price: parseFloat(price),
            date: date
        });
    } else {
        // Create new customer with order
        const newCustomer = {
            id: customers.length + 1,
            name: name,
            orders: [{
                product: product,
                price: parseFloat(price),
                date: date
            }]
        };
        customers.push(newCustomer);
    }
    displayCustomers();
}

// Function to delete customer
function deleteCustomer(id) {
    customers = customers.filter(customer => customer.id !== id);
    displayCustomers();
}

// Form submission handler
document.getElementById('addCustomerForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const name = document.getElementById('customerName').value;
    const product = document.getElementById('productName').value;
    const price = document.getElementById('productPrice').value;
    const date = document.getElementById('orderDate').value;
    
    addCustomerOrder(name, product, price, date);
    
    // Reset form
    this.reset();
});

// Initial display of customers
displayCustomers(); 