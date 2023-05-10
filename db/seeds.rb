# frozen_string_literal: true

# seeds.rb

# Addresses
Address.create(street: 'Rua Klaus', public_place: 'Av. Lube', zip_code: '12345678', number: '123', neighborhood: 'Centro', city: 'Rio de Janeiro', addressable_type: 'Client', addressable_id: 1)
Address.create(street: 'Rua Andrade', public_place: 'Av. Guilherme', zip_code: '87654321', number: '456', neighborhood: 'Vila Madalena', city: 'São Paulo', addressable_type: 'Store', addressable_id: 1)
Address.create(street: 'Rua Joao', public_place: 'Av. Guilherme', zip_code: '99999998', number: '456', neighborhood: 'Vila Madalena', city: 'São Paulo', addressable_type: 'Supplier', addressable_id: 1)

# Clients
Client.create(name: 'João Silva', CPF: '12345678900', address_id: 1)
Client.create(name: 'Maria Santos', CPF: '98765432100', address_id: 1)

# Products
Product.create(name: 'Maça', unit_price: 10.00, description: 'Description 1')
Product.create(name: 'Banana', unit_price: 20.00, description: 'Description 2')

# Suppliers
Supplier.create(address_id: 3, name: 'Supplier 1', CNPJ: '12345678901234')
Supplier.create(address_id: 3, name: 'Supplier 2', CNPJ: '56789012345678')

# ProductSuppliers
ProductSupplier.create(product_id: 1, supplier_id: 1)
ProductSupplier.create(product_id: 2, supplier_id: 2)

# Stores
Store.create(address_id: 2, name: 'Store 1', CNPJ: '12345678901234')
Store.create(address_id: 2, name: 'Store 2', CNPJ: '56789012345678')

# Storages
Storage.create(product_id: 1, store_id: 1, quantity: 10)
Storage.create(product_id: 2, store_id: 1, quantity: 20)

# Sales
Sale.create(client_id: 1, store_id: 1, fiscal_number: '123456789', total_amount: 100.00, status: 1)
Sale.create(client_id: 2, store_id: 1, fiscal_number: '987654321', total_amount: 200.00, status: 1)

# SaleProducts
SaleProduct.create(sale_id: 1, product_id: 1, quantity: 10)
SaleProduct.create(sale_id: 2, product_id: 2, quantity: 20)

