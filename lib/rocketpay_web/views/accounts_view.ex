defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{account: %Account{id: id, balance: balance}}) do
    %{
      mesage: "Balance changed successufully",
      account: %{
        id: id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{transaction: %TransactionResponse{from: from, to: to}}) do
    %{
      mesage: "Transaction done successufully",
      transaction: %{
        from: %{
          id: from.id,
          balance: from.balance
        },
        to: %{
          id: to.id,
          balance: to.balance
        }
      }
    }
  end
end
