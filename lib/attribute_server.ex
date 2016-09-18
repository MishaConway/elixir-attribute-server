defmodule AttributeServer do
  defmacro __using__(_opts) do
    quote do
      use GenServer

      def start_link do
        pid = Process.whereis __MODULE__
        if pid do
          pid
        else
          {:ok, pid} = :gen_server.start_link(__MODULE__, %{}, [])
          Process.register pid, __MODULE__
          pid
        end
      end

      defp ensure_started do
        start_link
      end

      def get(attr) do
        ensure_started
        :gen_server.call(__MODULE__, {:get, attr})
      end

      def set(attr, value) do
        ensure_started
        :gen_server.cast(__MODULE__, {:set, attr, value})
      end

      def all do
        ensure_started
        :gen_server.call(__MODULE__, {:all})
      end

      def clear do
        ensure_started
        :gen_server.cast(__MODULE__, {:clear})
      end

      def size do
        ensure_started
        :gen_server.call(__MODULE__, {:size})
      end

      def handle_call({:get, attr}, _from, attributes) do
        {:reply, attributes[attr], attributes}
      end

      def handle_call({:all}, _from, attributes) do
        {:reply, attributes, attributes}
      end

      def handle_call({:size}, _from, attributes) do
        {:reply, Enum.count(attributes), attributes}
      end

      def handle_cast({:set, attr, value}, attributes) do
        {:noreply, Map.put(attributes, attr, value)}
      end

      def handle_cast({:clear}, attributes) do
        {:noreply, %{}}
      end
    end
  end
end
