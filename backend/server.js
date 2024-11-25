const express = require('express');
const cors = require('cors');
const fs = require('fs').promises;
const path = require('path');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Path to our data file
const dataFile = path.join(__dirname, 'data', 'customers.json');

// Helper function to read data
async function readData() {
    try {
        const data = await fs.readFile(dataFile, 'utf8');
        return JSON.parse(data);
    } catch (error) {
        // If file doesn't exist, return empty array
        if (error.code === 'ENOENT') {
            return [];
        }
        throw error;
    }
}

// Helper function to write data
async function writeData(data) {
    // Ensure the data directory exists
    await fs.mkdir(path.dirname(dataFile), { recursive: true });
    await fs.writeFile(dataFile, JSON.stringify(data, null, 2));
}

// Routes
app.get('/api/customers', async (req, res) => {
    try {
        const customers = await readData();
        res.json(customers);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

app.post('/api/customers', async (req, res) => {
    try {
        const { name, product, price, date } = req.body;
        const customers = await readData();
        
        // Find existing customer
        const existingCustomer = customers.find(c => c.name.toLowerCase() === name.toLowerCase());
        
        if (existingCustomer) {
            // Add order to existing customer
            existingCustomer.orders.push({ product, price: parseFloat(price), date });
        } else {
            // Create new customer
            const newCustomer = {
                id: Date.now().toString(), // Using timestamp as ID
                name,
                orders: [{ product, price: parseFloat(price), date }]
            };
            customers.push(newCustomer);
        }
        
        await writeData(customers);
        res.status(201).json({ message: 'Order added successfully' });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

app.delete('/api/customers/:id', async (req, res) => {
    try {
        const customers = await readData();
        const filteredCustomers = customers.filter(customer => customer.id !== req.params.id);
        
        await writeData(filteredCustomers);
        res.json({ message: 'Customer deleted' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`)); 