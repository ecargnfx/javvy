defmodule Javvy.BrainstormTest do
  use Javvy.DataCase

  alias Javvy.Brainstorm

  describe "thoughts" do
    alias Javvy.Brainstorm.Thought

    @valid_attrs %{assumption: "some assumption", customer: "some customer", idea: "some idea", problem: "some problem"}
    @update_attrs %{assumption: "some updated assumption", customer: "some updated customer", idea: "some updated idea", problem: "some updated problem"}
    @invalid_attrs %{assumption: nil, customer: nil, idea: nil, problem: nil}

    def thought_fixture(attrs \\ %{}) do
      {:ok, thought} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brainstorm.create_thought()

      thought
    end

    test "list_thoughts/0 returns all thoughts" do
      thought = thought_fixture()
      assert Brainstorm.list_thoughts() == [thought]
    end

    test "get_thought!/1 returns the thought with given id" do
      thought = thought_fixture()
      assert Brainstorm.get_thought!(thought.id) == thought
    end

    test "create_thought/1 with valid data creates a thought" do
      assert {:ok, %Thought{} = thought} = Brainstorm.create_thought(@valid_attrs)
      assert thought.assumption == "some assumption"
      assert thought.customer == "some customer"
      assert thought.idea == "some idea"
      assert thought.problem == "some problem"
    end

    test "create_thought/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brainstorm.create_thought(@invalid_attrs)
    end

    test "update_thought/2 with valid data updates the thought" do
      thought = thought_fixture()
      assert {:ok, %Thought{} = thought} = Brainstorm.update_thought(thought, @update_attrs)
      assert thought.assumption == "some updated assumption"
      assert thought.customer == "some updated customer"
      assert thought.idea == "some updated idea"
      assert thought.problem == "some updated problem"
    end

    test "update_thought/2 with invalid data returns error changeset" do
      thought = thought_fixture()
      assert {:error, %Ecto.Changeset{}} = Brainstorm.update_thought(thought, @invalid_attrs)
      assert thought == Brainstorm.get_thought!(thought.id)
    end

    test "delete_thought/1 deletes the thought" do
      thought = thought_fixture()
      assert {:ok, %Thought{}} = Brainstorm.delete_thought(thought)
      assert_raise Ecto.NoResultsError, fn -> Brainstorm.get_thought!(thought.id) end
    end

    test "change_thought/1 returns a thought changeset" do
      thought = thought_fixture()
      assert %Ecto.Changeset{} = Brainstorm.change_thought(thought)
    end
  end
end
