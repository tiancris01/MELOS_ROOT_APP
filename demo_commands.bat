@echo off

echo === Melos useRootAsPackage Demo ===
echo.

echo 1. Install Melos globally (if not already installed):
echo    dart pub global activate melos
echo.

echo 2. Bootstrap the workspace (install dependencies for all packages):
echo    melos bootstrap
echo.

echo 3. List all packages in the workspace:
echo    melos list
echo.

echo 4. Run tests for all packages (including root):
echo    melos test
echo.

echo 5. Run tests for packages only (excluding root):
echo    melos test:packages
echo.

echo 6. Analyze all packages:
echo    melos analyze
echo.

echo 7. Build the main app only (using category filter):
echo    melos build:app
echo.

echo 8. Clean all packages:
echo    melos clean
echo.

echo 9. Format all packages:
echo    melos format
echo.

echo 10. Get dependencies for packages only:
echo     melos get:packages
echo.

echo 11. Check version status:
echo     melos version --dry-run
echo.

echo 12. Run the Flutter app:
echo     flutter run
echo.

echo === Key Features Demonstrated ===
echo.
echo √ Root directory treated as a package
echo √ Category-based filtering (app vs packages)
echo √ Local package dependencies from root
echo √ Unified workspace management
echo √ Cross-package testing and analysis
echo.

echo === Project Structure ===
echo.
echo melos_root_app/           # Root package (Flutter app)
echo ├── melos.yaml            # Melos configuration with useRootAsPackage: true
echo ├── pubspec.yaml          # Root package dependencies
echo ├── lib/main.dart         # App using local packages
echo ├── test/                 # Root package tests
echo └── packages/
echo     ├── utils/            # Utility package
echo     └── ui_components/    # UI components package
echo.

echo === Categories Configuration ===
echo.
echo app:
echo   - "."                  # Root directory
echo.
echo packages:
echo   - "packages/**"        # All packages under packages/
echo.

echo Run this demo by executing the commands above!

pause
