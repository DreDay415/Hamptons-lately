#!/usr/bin/env python3

import os
import re
import glob

def fix_article_file(file_path):
    """Fix a single article file to add proper readability containers"""
    print(f"📝 Processing: {file_path}")
    
    # Read the file
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Create backup
    backup_path = f"{file_path}.backup"
    with open(backup_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Fix the main structure
    # Replace: <main class="main">\n\t\t<div class="container">
    # With: <main class="main">\n\t\t<div class="article-container">\n\t\t\t<div class="container">
    content = re.sub(
        r'<main class="main">\s*\n\s*<div class="container">',
        '<main class="main">\n\t\t<div class="article-container">\n\t\t\t<div class="container">',
        content
    )
    
    # Fix the closing structure
    # Replace: </div>\n\t</main>
    # With: \t\t</div>\n\t\t</div>\n\t</main>
    content = re.sub(
        r'</div>\s*\n\s*</main>',
        '\t\t</div>\n\t\t</div>\n\t</main>',
        content
    )
    
    # Write the fixed content
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"✅ Updated: {file_path}")

def main():
    """Fix all article files"""
    print("🔧 Fixing article readability across all pages...")
    
    # Find all article files
    article_files = glob.glob("src/pages/articles/*.astro")
    
    if not article_files:
        print("❌ No article files found!")
        return
    
    print(f"📋 Found {len(article_files)} article files")
    
    # Process each file
    for file_path in article_files:
        try:
            fix_article_file(file_path)
        except Exception as e:
            print(f"❌ Error processing {file_path}: {e}")
    
    print("\n🎉 All article pages updated with improved readability!")
    print("📋 Changes made:")
    print("   - Added white background containers to all articles")
    print("   - Improved text contrast and readability")
    print("   - Maintained responsive design")
    print("\n💡 Next steps:")
    print("   1. Test with: npm run build")
    print("   2. Deploy to see the improvements")
    print("   3. All articles now have proper white backgrounds")

if __name__ == "__main__":
    main()
