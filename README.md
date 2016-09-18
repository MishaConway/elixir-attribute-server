# AttributeServer

genserver for globally storing attributes

## Installation

This code is available in Hex at (https://hex.pm/packages/attribute_server) and can be installed as:

  1. Add `attribute_server` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:attribute_server, "~> 0.1.0"}]
    end
    ```

## Configuration   

Use it in a module you want to track attributes in

```elixir
defmodule MyApp.GameState do
  ...
  use AttributeServer
  ...
end  
```

## Usage

set
```elixir
    # set some attributes
	   MyApp.GameState.set :current_score, 1000
     MyApp.GameState.set :current_level, 3
```

get
```elixir
    # get some attributes
	   MyApp.GameState.get :current_score
     MyApp.GameState.get :current_level
```

all
```elixir
  # retrieve all attributes
	MyApp.GameState.all
```

clear
```elixir
  # clear all attributes
	MyApp.GameState.clear
```

size
```elixir
  # get total number of attributes
	MyApp.GameState.size
```
