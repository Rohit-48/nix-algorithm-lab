# Multi-Language Data Structures and Algorithms Flake

## 🚀 Project Overview

This repository is a comprehensive collection of Data Structures and Algorithms (DSA) implemented across multiple programming languages, leveraging Nix for reproducible development environments.

## 🛠 Supported Languages

- C/C++
- Python
- Haskell
- Rust

## 📦 Project Structure Example

```
dsa-algorithms/
│
├── flake.nix           # Nix environment configuration
├── justfile            # Project automation commands
│
├── c_cpp/
│   └── src/
│       ├── binary-search/
│       └── sorting-algorithms/
│
├── python/
│   └── src/
│       ├── graph-algorithms/
│       └── data-structures/
│
├── haskell/
│   └── src/
│       └── functional-algorithms/
│
└── rust/
    └── src/
        └── performance-critical-algorithms/
```

## 🔧 Prerequisites

- [Nix](https://nixos.org/download.html)
- Git
- (Optional) [direnv](https://direnv.net/) for automatic environment loading

##  Setup and Installation

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/dsa-algorithms.git
cd dsa-algorithms
```
```

### 2. Enter Development Environment

```bash
# Enter the Nix development shell
nix develop

# Or with direnv (recommended)
direnv allow
```

##  Project Workflow Commands

### Creating New Algorithms

```bash
# Create a new algorithm in a specific language
just new-algo c binary-search
just new-algo python graph-traversal
just new-algo rust network-algorithms
just new-algo haskell functional-programming
```

### Running Tests

```bash
# Run tests across all languages
just test

# Or test a specific language
just test-c
just test-python
```

### Other Useful Commands

```bash
# List current algorithms
just list-algos

# Clean build artifacts
just clean
```

## 📝 Contributing Guidelines

1. **Language-Specific Best Practices**
   - Follow each language's idioms and best practices
   - Maintain consistent code quality
   - Write comprehensive tests

2. **Algorithm Implementation**
   - Include time and space complexity analysis
   - Add clear documentation
   - Provide example use cases

3. **Pull Request Process**
   - Fork the repository
   - Create a feature branch
   - Implement your algorithm
   - Add tests
   - Submit a pull request


