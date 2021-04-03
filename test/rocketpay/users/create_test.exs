defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.{User, Repo}
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "When all params are valid, returns an user" do
      params = %{
        name: "Rafael",
        password: "123456",
        nickname: "camarda",
        email: "rafa@banana.com",
        age: 27
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{id: ^user_id, nickname: "camarda", name: "Rafael", age: 27} = user
    end

    test "When there are invalid params, returns an error" do
      params = %{
        name: "Rafael",
        nickname: "camarda",
        email: "rafa@banana.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expecetd_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expecetd_response
    end
  end
end
