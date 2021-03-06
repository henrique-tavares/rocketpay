defmodule Rocketpay.Accounts.Withdraw do
  alias Rocketpay.{Repo, Accounts.Operation}

  def call(params) do
    params
    |> Operation.call(:withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operaions, reason, _changes} -> {:error, reason}
      {:ok, %{withdraw: account}} -> {:ok, account}
    end
  end
end
