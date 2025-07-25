# Client Searcher CLI

A Ruby command-line tool to:

* Search clients by partial name
* Find duplicate emails

##  Features

* CLI interface with command args
* Works on both Windows and Unix-like OS
* Fully tested with RSpec

## Setup

1. Clone the repo and navigate to the project folder.
2. Install dependencies (if using Bundler):

   ```bash
   bundle install
   ```
3. Make sure `clients.json` is in the root directory.

## 💻 Usage

### 🔹 Windows

```bash
ruby run.rb search <query>

ruby run.rb duplicates
```

### 🔹 macOS / Linux / WSL

```bash
ruby run.rb search <query>

ruby run.rb duplicates
```

## Running Unit Tests with RSpec

RSpec is used to test all core components.

### Manual Test Run

To run the tests manually:

bundle exec rspec

Or if you’re not using Bundler:

rspec

This will run all test files under the spec/ directory.

### What Is Tested


Searcher: matches partial names, handles case insensitivity and invalid input

DuplicateFinder: detects duplicate and unique emails

Loader: verifies JSON load behavior and error handling

## Examples

```bash
ruby run.rb search <query>

ruby run.rb duplicates
```

---

## Limitations

* Only supports `full_name` search
* JSON file path is hardcoded (`clients.json`)

## How you would enhance or refactor the architecture?
* **Accept JSON File Path via Argument (Local or URL)**

  * Instead of hardcoding the `clients.json` path, allow the user to pass a local file path or URL via command-line arguments.
  * Example:

    ```bash
    ruby run.rb search michael --file ./data/clients_2024.json
    ruby run.rb duplicates --file https://example.com/clients.json
    ```
  * Benefits:

    * Supports multiple datasets
    * Easier to use in scripts or integrate with APIs
    * Makes the tool more reusable and testable

* **Split CLI Parsing from Core Logic**

  * Move ARGV parsing into a dedicated `CommandParser` or CLI adapter.
  * This keeps `App` focused on logic and allows alternate interfaces (like HTTP) in the future.

* **Replace `puts` with Logger**

  * Use Ruby’s built-in `Logger` for configurable logging levels (info, warn, error).
  * Enables structured logs for production-grade apps.

## Features or improvements you would prioritise next?
* **Dynamic Field Search**

  * Allow the user to search by any field (`email`, `id`, etc.) instead of only `full_name`.
  * Example:

    ```bash
    ruby run.rb search smith --field email
    ```

* **REST API Interface**

  * Reuse existing logic behind a lightweight web framework like Sinatra or Rails API-only mode.
  * Useful for integrating with frontend dashboards or remote tools.

* **CLI-Level Integration Tests**

  * Extend RSpec with command-line execution tests using `Open3.capture3`.
  * Simulate full CLI runs and validate stdout/stderr.

* **Output Format Options**

  * Add support for outputting results in formats like CSV or JSON.
  * Allow saving to file via `--output result.csv`.

* **Support for Large Datasets**

  * Move to an indexed format using SQLite or lightweight DB.
  * Enables pagination and sorting without loading everything into memory.
