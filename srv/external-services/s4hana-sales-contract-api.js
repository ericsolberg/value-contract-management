const cds = require('@sap/cds');
const axios = require('axios');

module.exports = cds.service.impl(async function() {
    this.on('fetchSalesContracts', async () => {
        try {
            // Using JSONPlaceholder as a mock API
            const response = await axios.get('https://jsonplaceholder.typicode.com/posts');

            // Transform the mock data to match our CDS entity structure
            const salesContracts = response.data.slice(0, 5).map(post => ({
                ID: cds.utils.uuid(),
                contractId: post.id.toString(),
                customerId: post.userId.toString(),
                totalAmount: Math.floor(Math.random() * 10000) / 100, // Random amount
                status: ['Draft', 'Active', 'Completed'][Math.floor(Math.random() * 3)] // Random status
            }));

            return salesContracts;
        } catch (error) {
            console.error('Error fetching sales contracts:', error);
            throw new Error('Failed to fetch sales contracts from S/4HANA');
        }
    });
});
