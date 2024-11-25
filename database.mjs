// Import required packages
import dotenv from 'dotenv';
import { Sequelize, DataTypes } from 'sequelize';

// Load environment variables
dotenv.config();

// Initialize Sequelize instance using environment variables
const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  dialect: 'mysql', // Adjust as needed
});

// Define a data model
const User = sequelize.define('User', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
    validate: {
      isEmail: true,
    },
  },
  age: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  tableName: 'users',
  timestamps: true,
});

// Test the database connection
const testConnection = async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');

    // Sync the data model
    await sequelize.sync({ alter: true });
    console.log('Database synced successfully.');

    // Create a test user (optional)
    const testUser = await User.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      age: 30,
    });
    console.log('Test user created:', testUser.toJSON());
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  } finally {
    // Close the connection
    await sequelize.close();
  }
};

// Execute the test connection
testConnection();
