# Melos Root App - useRootAsPackage Demo

This project demonstrates the **`useRootAsPackage`** feature of Melos, which allows the repository root directory to be treated as a package in the workspace.

## Project Structure

```
melos_root_app/
├── melos.yaml              # Melos workspace configuration
├── pubspec.yaml            # Root package (Flutter app)
├── lib/                    # Root package source code
│   └── main.dart
├── test/                   # Root package tests
└── packages/               # Additional workspace packages
    ├── utils/              # Utility package
    │   ├── pubspec.yaml
    │   ├── lib/
    │   └── test/
    └── ui_components/       # UI components package
        ├── pubspec.yaml
        ├── lib/
        └── test/
```

## Melos Configuration

The key configuration in `melos.yaml`:

```yaml
melos:
  useRootAsPackage: true
  categories:
    app:
      - "." # Root directory as app category
    packages:
      - "packages/**" # All packages under packages/
```

## Features Demonstrated

### 1. Root as Package

- The root directory contains a complete Flutter application
- Root package can depend on local workspace packages
- Melos treats root the same as any other package

### 2. Package Categories

- **app category**: Contains the root Flutter application
- **packages category**: Contains utility and component packages

### 3. Version-Based Package Dependencies

The root app depends on local packages using version constraints:

```yaml
dependencies:
  utils: ^1.0.0
  ui_components: ^1.0.0
```

Melos automatically overrides these with local paths during development:

```yaml
# In melos.yaml
melos:
  dependencyOverrides:
    utils:
      path: packages/utils
    ui_components:
      path: packages/ui_components
```

This approach allows:

- **Development**: Uses local packages for hot reload and development
- **Publishing**: Uses proper semantic versioning
- **CI/CD**: Can test against both local and published versions

### 4. Melos Scripts

Configured scripts for workspace management:

- `melos bootstrap` - Install dependencies for all packages
- `melos test` - Run tests across all packages
- `melos analyze` - Analyze all packages
- `melos build:app` - Build only the main app (category filter)
- `melos test:packages` - Test only workspace packages

## Packages

### Root Package (melos_root_app)

- **Type**: Flutter application
- **Purpose**: Main application demonstrating useRootAsPackage
- **Dependencies**: utils, ui_components

### utils Package

- **Type**: Dart library
- **Purpose**: Common utility functions
- **Features**:
  - StringUtils: capitalize, reverse, isPalindrome
  - MathUtils: factorial, isPrime, gcd

### ui_components Package

- **Type**: Flutter package
- **Purpose**: Reusable UI components
- **Dependencies**: flutter, utils
- **Components**:
  - CustomButton: Enhanced button widget
  - CustomCard: Styled card widget

## Getting Started

### Prerequisites

- Flutter SDK 3.24.0+
- Dart SDK 3.8.1+

### Setup

1. **Install Melos globally** (optional but recommended):

   ```bash
   dart pub global activate melos
   ```

2. **Bootstrap the workspace**:

   ```bash
   melos bootstrap
   ```

   Or if Melos is not global:

   ```bash
   dart pub global run melos bootstrap
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Available Melos Commands

```bash
# Bootstrap all packages
melos bootstrap

# Run tests for all packages
melos test

# Run tests for packages only (excluding root)
melos test:packages

# Analyze all packages
melos analyze

# Clean all packages
melos clean

# Format all packages
melos format

# Build the main app only
melos build:app

# Get dependencies for packages only
melos get:packages

# List all packages
melos list

# Check package versions
melos version --dry-run
```

## Use Cases for useRootAsPackage

### 1. Legacy Project Migration

- Projects migrating from Melos 6.x that have the main application in root
- Gradual adoption of monorepo structure

### 2. Primary App at Root

- Projects where the main Flutter app lives at repository root
- Natural project organization for app-centric repositories

### 3. Category-based Filtering

- Apply different operations to root vs. packages
- Build only the app, test only packages, etc.

### 4. Single Package Projects

- Non-monorepo projects wanting Melos features
- Use Melos for versioning, publishing, changelog generation on single packages

## Benefits

1. **Flexibility**: Accommodates existing project structures
2. **Consistency**: Root package behaves like any other package
3. **Organization**: Clear separation between app and libraries
4. **Tooling**: Full Melos feature set available for root package
5. **Migration**: Easier migration path for legacy projects

## Testing the Setup

1. **Run the app** to see the demo interface
2. **Test utilities** using the "Test Utilities" button
3. **Verify Melos integration**:

   ```bash
   melos list
   ```

   Should show all packages including root

4. **Test category filtering**:
   ```bash
   melos analyze --category=packages
   ```

## Notes

- While this approach works well, Melos generally recommends keeping the root focused on workspace configuration for pure monorepos
- The `useRootAsPackage` feature provides flexibility for existing structures and single-package usage
- Root package follows the same conventions as other packages in the workspace
