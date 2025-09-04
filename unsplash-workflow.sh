#!/bin/bash

# Unsplash to WebP Workflow for Hamptons Lately
# Downloads → Convert → Organize → Deploy

echo "🖼️  Unsplash to WebP Workflow"
echo "=============================="

# Configuration
DOWNLOAD_DIR="$HOME/Downloads/hamptons-images"
PROJECT_IMAGES_DIR="public/images/articles"

# Function to show available articles
show_articles() {
    echo "📰 Available articles:"
    echo "1. 85-dollar-watermelon"
    echo "2. weekend-spotlight" 
    echo "3. beach-access"
    echo "4. infinity-pool"
    echo "5. local-man-survives"
    echo "6. backyard-tennis-court"
    echo "7. best-bar-sag-harbor"
    echo "8. champagne-shortage"
    echo "9. hamptons-traffic-report"
    echo "10. meditation-studio"
    echo "11. neighbors-outraged"
    echo "12. restaurant-locals-discount"
    echo "13. tesla-owner-charging"
    echo "14. traffic-report-terrible"
    echo "15. whale-sighted"
    echo ""
}

# Function to convert and organize images
process_images() {
    local article_name="$1"
    local quality="${2:-85}"
    
    if [[ -z "$article_name" ]]; then
        echo "❌ Please specify an article name"
        return 1
    fi
    
    # Check if download directory has images
    if [[ ! -d "$DOWNLOAD_DIR" ]] || [[ -z "$(ls -A "$DOWNLOAD_DIR" 2>/dev/null)" ]]; then
        echo "❌ No images found in $DOWNLOAD_DIR"
        echo "💡 Please download images from Unsplash first!"
        echo ""
        echo "📋 Recommended Unsplash searches for '$article_name':"
        case "$article_name" in
            "85-dollar-watermelon")
                echo "   - 'expensive fruit luxury market'"
                echo "   - 'watermelon grocery store premium'"
                echo "   - 'luxury food shopping'"
                ;;
            "weekend-spotlight")
                echo "   - 'hamptons weekend luxury'"
                echo "   - 'east hampton beach house'"
                echo "   - 'sag harbor weekend'"
                ;;
            "beach-access")
                echo "   - 'private beach access'"
                echo "   - 'beach gate entrance'"
                echo "   - 'exclusive beach property'"
                ;;
            "infinity-pool")
                echo "   - 'infinity pool luxury'"
                echo "   - 'hamptons pool house'"
                echo "   - 'swimming pool construction'"
                ;;
            "local-man-survives")
                echo "   - 'man without phone'"
                echo "   - 'digital detox summer'"
                echo "   - 'person reading book'"
                ;;
            *)
                echo "   - 'hamptons luxury lifestyle'"
                echo "   - 'east hampton summer'"
                ;;
        esac
        return 1
    fi
    
    # Create article directory
    local article_dir="$PROJECT_IMAGES_DIR/$article_name"
    mkdir -p "$article_dir"
    
    echo "🔄 Processing images for: $article_name"
    echo "📁 Source: $DOWNLOAD_DIR"
    echo "📁 Destination: $article_dir"
    echo "🎯 Quality: $quality%"
    echo ""
    
    local count=0
    local success=0
    
    # Process each image
    for file in "$DOWNLOAD_DIR"/*.{jpg,jpeg,png}; do
        if [[ -f "$file" ]]; then
            count=$((count + 1))
            local filename=$(basename "$file")
            local name_without_ext="${filename%.*}"
            
            # Determine image type based on count
            local image_type
            case $count in
                1) image_type="hero" ;;
                2) image_type="content-1" ;;
                3) image_type="content-2" ;;
                4) image_type="thumbnail" ;;
                *) image_type="content-$count" ;;
            esac
            
            local output_file="$article_dir/${image_type}.webp"
            
            echo "🔄 Converting: $filename → ${image_type}.webp"
            
            # Convert to WebP
            magick "$file" -quality "$quality" "$output_file"
            
            if [[ $? -eq 0 ]]; then
                # Get file sizes
                local input_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo "0")
                local output_size=$(stat -f%z "$output_file" 2>/dev/null || stat -c%s "$output_file" 2>/dev/null || echo "0")
                
                if [[ "$input_size" != "0" && "$output_size" != "0" ]]; then
                    local savings=$((100 - (output_size * 100 / input_size)))
                    echo "✅ Success! Size: ${input_size} → ${output_size} bytes (${savings}% smaller)"
                else
                    echo "✅ Success! Converted to WebP"
                fi
                success=$((success + 1))
            else
                echo "❌ Conversion failed for: $filename"
            fi
            echo ""
        fi
    done
    
    echo "📊 Processing complete!"
    echo "   Total files: $count"
    echo "   Successful: $success"
    echo "   Failed: $((count - success))"
    echo ""
    
    if [[ $success -gt 0 ]]; then
        echo "🎉 Images ready for $article_name!"
        echo "📁 Location: $article_dir"
        echo ""
        echo "💡 Next steps:"
        echo "   1. Update your article component"
        echo "   2. Use: src=\"/images/articles/$article_name/hero.webp\""
        echo "   3. Test with: npm run build"
        echo ""
        
        # Show what was created
        echo "📋 Created files:"
        ls -la "$article_dir"/*.webp 2>/dev/null | while read -r line; do
            echo "   $line"
        done
    fi
}

# Function to clean up download directory
cleanup() {
    echo "🧹 Cleaning up download directory..."
    if [[ -d "$DOWNLOAD_DIR" ]]; then
        rm -f "$DOWNLOAD_DIR"/*.{jpg,jpeg,png}
        echo "✅ Cleaned up: $DOWNLOAD_DIR"
    else
        echo "ℹ️  Download directory doesn't exist: $DOWNLOAD_DIR"
    fi
}

# Function to show usage examples
show_examples() {
    echo "📋 Usage Examples:"
    echo ""
    echo "1. Download images from Unsplash to: $DOWNLOAD_DIR"
    echo "2. Process images for an article:"
    echo "   ./unsplash-workflow.sh process 85-dollar-watermelon 85"
    echo ""
    echo "3. Clean up after processing:"
    echo "   ./unsplash-workflow.sh cleanup"
    echo ""
    echo "4. Show available articles:"
    echo "   ./unsplash-workflow.sh articles"
    echo ""
    echo "📱 Unsplash Tips:"
    echo "   - Search for high-resolution images (1920x1080 or larger)"
    echo "   - Download as JPG for best compatibility"
    echo "   - Get 3-4 images per article (hero, content, thumbnail)"
    echo "   - Use descriptive search terms related to your article"
}

# Main script logic
case "${1:-help}" in
    "process")
        if [[ $# -lt 2 ]]; then
            echo "❌ Usage: $0 process <article-name> [quality]"
            echo ""
            show_articles
            exit 1
        fi
        process_images "$2" "${3:-85}"
        ;;
    "articles")
        show_articles
        ;;
    "cleanup")
        cleanup
        ;;
    "examples")
        show_examples
        ;;
    "help"|*)
        echo "Usage: $0 <command> [options]"
        echo ""
        echo "Commands:"
        echo "  process <article-name> [quality]  - Convert and organize images"
        echo "  articles                          - Show available articles"
        echo "  cleanup                           - Clean up download directory"
        echo "  examples                          - Show usage examples"
        echo "  help                              - Show this help"
        echo ""
        echo "Workflow:"
        echo "  1. Download images from Unsplash to: $DOWNLOAD_DIR"
        echo "  2. Run: $0 process <article-name>"
        echo "  3. Update your article component"
        echo "  4. Run: $0 cleanup"
        echo ""
        show_articles
        ;;
esac
