Bank Tech Test
=================

Description:
-------
The program acts as a basic little account keeping solution. It lets user to create an account, make debit and credit transactions, and print a statement. The program manages the current balance as well.

### Instructions for how to run the program

```
$ git clone https://github.com/peter-miklos/bank_tech_test_ruby.git
$ bundle
$ rspec
```
Use IRB to interact with the code.
User stories
-------
```
As a User
So that I can manage my financials
I want to open an account

As a User
So that I can use the money on my account
I want to make credit and debit transactions

As a User
So that I can plan my future spending and check transaction history
I want to see an account statement
```

Tests
-------
### Feature tests
The program's main features are tested in IRB:
```
2.3.1 :001 > require './lib/account.rb'
 => true
2.3.1 :002 > account = Account.new
 => #<Account:0x007fd8e2a05f38 @transaction_log=#<TransactionLog:0x007fd8e2a05f10 @transactions=[], @transaction_class=Transaction>, @statement_engine=#<StatementEngine:0x007fd8e2a05e48>, @balance=0>
2.3.1 :003 > account.deposit(1000)
 => 1000
2.3.1 :004 > account.deposit(200)
 => 1200
2.3.1 :005 > account.print_statement
date || credit || debit || balance
18/10/2016 || 200.00 || || 1200.00
18/10/2016 || 1000.00 || || 1000.00
 => nil
2.3.1 :006 > account.withdraw(333)
 => 867
2.3.1 :007 > account.print_statement
date || credit || debit || balance
18/10/2016 || || 333.00 || 867.00
18/10/2016 || 200.00 || || 1200.00
18/10/2016 || 1000.00 || || 1000.00
```
### Unit tests
The following unit tests are used:
```
Account
  balance
    starts with 0 as opening balance if account instantiated w/o opening balance
    starts with 10 as opening balance if account instantiated with 10 units
  #deposit
    calls the deposit method on transaction_log
    adds the amount to the current balance
  #withdrawn
    calls the withdraw method on transaction_log
    deducts the amount from the current balance
  #print_statement
    calls the print_statement method on the statement engine

StatementEngine
  #print_statement
    prints out the statement with header

TransactionLog
  #deposit
    create credit transaction and add it to transactions array
  #withdraw
    creates debit transaction and add it to transactions array
  #transactions
    returns the array of transactions

Transaction
  #amount
    returns the credit amount
    returns the debit amount
  #type
    returns the type of a credit transaction
    returns the type of a debit transaction
  #date
    returns the date of credit transaction
    returns the date of the debit transaction
  #balance
    returns the balance after the credit transaction is created
    returns the balance after the debit transaction is created

```
