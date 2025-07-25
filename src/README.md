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

