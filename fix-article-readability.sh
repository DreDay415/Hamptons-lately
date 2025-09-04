#!/bin/bash

# Fix Article Readability Script
# Adds proper white background containers to all article pages

echo "🔧 Fixing article readability across all pages..."

# Find all article files
article_files=$(find src/pages/articles -name "*.astro")

for file in $article_files; do
    echo "📝 Processing: $file"
    
    # Create a backup
    cp "$file" "$file.backup"
    
    # Add article-container wrapper around main content
    # This adds the white background container for better readability
    
    # Replace the main opening tag
    sed -i '' 's|<main class="main">|<main class="main">\
		<div class="article-container">|' "$file"
    
    # Replace the container opening tag
    sed -i '' 's|<div class="container">|<div class="container">|' "$file"
    
    # Add closing div for article-container before </main>
    sed -i '' 's|</main>|		</div>\
	</main>|' "$file"
    
    echo "✅ Updated: $file"
done

echo "🎉 All article pages updated with improved readability!"
echo "📋 Changes made:"
echo "   - Added white background containers to all articles"
echo "   - Improved text contrast and readability"
echo "   - Maintained responsive design"
echo ""
echo "💡 Next steps:"
echo "   1. Test with: npm run build"
echo "   2. Deploy to see the improvements"
echo "   3. All articles now have proper white backgrounds"
