# Project Commands

# Default recipe to show available commands
default:
    @just --list

# Initialize project directories and basic structure
init:
    mkdir -p c_cpp/src python/src haskell/src rust/src
    touch c_cpp/README.md python/README.md haskell/README.md rust/README.md

# Clean build artifacts across all language directories
clean:
    find . -type d \( -name "build" -o -name "target" -o -name "__pycache__" \) -exec rm -rf {} +

# Run tests across all language implementations
test:
    #!/usr/bin/env bash
    
    # C/C++ tests
    if [ -d c_cpp/src ]; then
        echo "Running C/C++ tests..."
        cd c_cpp && cmake . && make && ctest
        cd ..
    fi

    # Python tests
    if [ -d python/src ]; then
        echo "Running Python tests..."
        cd python
        python -m pytest
        cd ..
    fi

    # Haskell tests
    if [ -d haskell/src ]; then
        echo "Running Haskell tests..."
        cd haskell
        cabal test
        cd ..
    fi

    # Rust tests
    if [ -d rust/src ]; then
        echo "Running Rust tests..."
        cd rust
        cargo test
        cd ..
    fi

# Create a new algorithm implementation
new-algo LANG NAME:
    #!/usr/bin/env bash
    case "{{LANG}}" in
        c++)
            mkdir -p c_cpp/src/{{NAME}}
            touch c_cpp/src/{{NAME}}/{{NAME}}.cpp c_cpp/src/{{NAME}}/{{NAME}}.h c_cpp/src/{{NAME}}/test_{{NAME}}.cpp
            ;;
        c)
            mkdir -p c_cpp/src/{{NAME}}
            touch c_cpp/src/{{NAME}}/{{NAME}}.c c_cpp/src/{{NAME}}/{{NAME}}.h c_cpp/src/{{NAME}}/test_{{NAME}}.c
            ;;
        python)
            mkdir -p python/src/{{NAME}}
            touch python/src/{{NAME}}/{{NAME}}.py python/src/{{NAME}}/test_{{NAME}}.py
            ;;
        haskell)
            mkdir -p haskell/src/{{NAME}}
            touch haskell/src/{{NAME}}/{{NAME}}.hs haskell/src/{{NAME}}/Test{{NAME}}.hs
            ;;
        rust)
            mkdir -p rust/src/{{NAME}}
            touch rust/src/{{NAME}}/src/lib.rs rust/src/{{NAME}}/src/main.rs rust/src/{{NAME}}/tests/{{NAME}}_test.rs
            ;;
        *)
            echo "Unsupported language. Use: c, c++, python, haskell, or rust"
            exit 1
            ;;
    esac
    echo "Created new algorithm implementation for {{LANG}}: {{NAME}}"

# List all current algorithm implementations
list-algos:
    #!/usr/bin/env bash
    echo "C/C++ Algorithms:"
    find c_cpp/src -maxdepth 1 -type d | sed 's|c_cpp/src/||' | grep -v "^src$"
    
    echo -e "\nPython Algorithms:"
    find python/src -maxdepth 1 -type d | sed 's|python/src/||' | grep -v "^src$"
    
    echo -e "\nHaskell Algorithms:"
    find haskell/src -maxdepth 1 -type d | sed 's|haskell/src/||' | grep -v "^src$"
    
    echo -e "\nRust Algorithms:"
    find rust/src -maxdepth 1 -type d | sed 's|rust/src/||' | grep -v "^src$"
