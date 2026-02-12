# Import Path Migration Script

# This script will update import paths across all migrated files
# Old pattern -> New pattern

# Update imports in presentation layer components
Get-ChildItem -Path "lib\src\presentation\components" -Recurse -Filter "*.dart" | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $updated = $content
    
    # Update enum imports
    $updated = $updated -replace "import '../../../s_design.dart'", "import '../../../../s_design.dart'"
    $updated = $updated -replace "import '../../enums/", "import '../../../../domain/entities/config/"
    $updated = $updated -replace "import '../enums/", "import '../../../domain/entities/config/"
    $updated = $updated -replace "import 'enums/", "import '../../../domain/entities/config/"
    
    # Update theme imports  
    $updated = $updated -replace "import '../../../theme/s_colors.dart'", "import '../../themes/tokens/colors.dart'"
    $updated = $updated -replace "import 'themes/s_", "import '../../themes/extensions/component_themes/s_"
    $updated = $updated -replace "import '../themes/s_", "import '../../../themes/extensions/component_themes/s_"
    
    # Update utils imports
    $updated = $updated -replace "import 'utils/", "import '../../../../core/utils/"
    $updated = $updated -replace "import '../utils/", "import '../../../../core/utils/"
    
    # Update common imports
    $updated = $updated -replace "import '../../common/", "import '../../common/"
    
    if ($content -ne $updated) {
        Set-Content -Path $_.FullName -Value $updated -NoNewline
        Write-Host "Updated: $($_.Name)"
    }
}

Write-Host "`nImport paths updated in presentation layer"
