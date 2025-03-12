# Address Hack

A Ruby on Rails application for managing companies, addresses, and items with advanced tracking capabilities.

## Features

- Company management with billing and shipping addresses
- Item tracking with serial and lot number support
- Inventory management with multiple unit types
- ABC classification system
- Export control tracking (ECCN codes)

## Requirements

- Ruby 3.2.0 or higher
- Rails 7.1 or higher
- PostgreSQL 12 or higher
- Node.js 16 or higher
- Yarn 1.22 or higher

## Setup

1. Clone the repository:
```bash
git clone https://github.com/petefarmer/address_hack.git
cd address_hack
```

2. Install dependencies:
```bash
bundle install
yarn install
```

3. Setup the database:
```bash
rails db:create
rails db:migrate
```

4. Start the server:
```bash
bin/dev
```

The application will be available at http://localhost:3000

## Development

- Run tests: `rails test`
- Run the linter: `rubocop`
- Run the development server: `bin/dev`

## License

This project is licensed under the MIT License.
