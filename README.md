# Value Contract Management

This project implements a Value Contract Management system with an external integration to the SAP S/4HANA Sales Data Products Sales Contract API.

## External Integration

We've added an external integration that mimics the SAP S/4HANA Sales Data Products Sales Contract API. This integration is implemented in `srv/external-services/s4hana-sales-contract-api.js`.

### How it works

1. The external service uses JSONPlaceholder as a mock API to simulate fetching data from S/4HANA.
2. It transforms the mock data to match our CDS entity structure for sales contracts.
3. The main service (`srv/service.js`) connects to this external service and exposes a `fetchS4HANASalesContracts` function.

### Testing the integration

You can test the integration by making a GET request to:

```
http://localhost:4004/odata/v4/value-contract/fetchS4HANASalesContracts()
```

This will return a list of mock sales contracts.

## Setup and Running

1. Install dependencies:
   ```
   npm install
   ```

2. Start the CAP server:
   ```
   npm run start
   ```

3. The server will be available at `http://localhost:4004`.

## Next Steps

- Implement real authentication for the S/4HANA API when moving to production.
- Extend the integration to handle more complex scenarios and data structures.
- Implement error handling and retry mechanisms for production use.
