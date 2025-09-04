#!/bin/bash

# Image Conversion Script for Hamptons Lately
# Converts JPG/PNG images to optimized WebP format

echo "🖼️  Hamptons Lately Image Converter"
echo "====================================="

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "❌ ImageMagick not found. Please install it first:"
    echo "   brew install imagemagick"
    exit 1
fi

# Check if webp tools are installed
if ! command -v cwebp &> /dev/null; then
    echo "❌ WebP tools not found. Please install them first:"
    echo "   brew install webp"
    exit 1
fi

echo "✅ ImageMagick and WebP tools are ready!"

# Function to convert a single image
convert_image() {
    local input_file="$1"
    local output_dir="$2"
    local quality="${3:-85}"
    
    if [[ ! -f "$input_file" ]]; then
        echo "❌ Input file not found: $input_file"
        return 1
    fi
    
    # Get filename without extension
    local filename=$(basename "$input_file")
    local name_without_ext="${filename%.*}"
    
    # Create output directory if it doesn't exist
    mkdir -p "$output_dir"
    
    # Convert to WebP
    local output_file="$output_dir/${name_without_ext}.webp"
    
    echo "🔄 Converting: $filename → ${name_without_ext}.webp"
    
    # Use ImageMagick for conversion
    magick "$input_file" -quality "$quality" "$output_file"
    
    if [[ $? -eq 0 ]]; then
        # Get file sizes
        local input_size=$(stat -f%z "$input_file" 2>/dev/null || stat -c%s "$input_file" 2>/dev/null || echo "0")
        local output_size=$(stat -f%z "$output_file" 2>/dev/null || stat -c%s "$output_file" 2>/dev/null || echo "0")
        
        if [[ "$input_size" != "0" && "$output_size" != "0" ]]; then
            local savings=$((100 - (output_size * 100 / input_size)))
            echo "✅ Success! Size: ${input_size} → ${output_size} bytes (${savings}% smaller)"
        else
            echo "✅ Success! Converted to WebP"
        fi
    else
        echo "❌ Conversion failed for: $filename"
        return 1
    fi
}

# Function to batch convert images
batch_convert() {
    local input_dir="$1"
    local output_dir="$2"
    local quality="${3:-85}"
    
    if [[ ! -d "$input_dir" ]]; then
        echo "❌ Input directory not found: $input_dir"
        return 1
    fi
    
    echo "🔄 Batch converting images from: $input_dir"
    echo "📁 Output directory: $output_dir"
    echo "🎯 Quality setting: $quality%"
    echo ""
    
    local count=0
    local success=0
    
    # Find all image files
    for file in "$input_dir"/*.{jpg,jpeg,png}; do
        if [[ -f "$file" ]]; then
            count=$((count + 1))
            if convert_image "$file" "$output_dir" "$quality"; then
                success=$((success + 1))
            fi
            echo ""
        fi
    done
    
    echo "📊 Batch conversion complete!"
    echo "   Total files: $count"
    echo "   Successful: $success"
    echo "   Failed: $((count - success))"
}

# Main script logic
case "${1:-help}" in
    "single")
        if [[ $# -lt 3 ]]; then
            echo "Usage: $0 single <input_file> <output_dir> [quality]"
            echo "Example: $0 single photo.jpg public/images/articles/watermelon/ 85"
            exit 1
        fi
        convert_image "$2" "$3" "${4:-85}"
        ;;
    "batch")
        if [[ $# -lt 3 ]]; then
            echo "Usage: $0 batch <input_dir> <output_dir> [quality]"
            echo "Example: $0 batch ~/Photos public/images/articles/watermelon/ 85"
            exit 1
        fi
        batch_convert "$2" "$3" "${4:-85}"
        ;;
    "setup")
        echo "🔧 Setting up image directories..."
        mkdir -p public/images/{articles,hero,sections,thumbnails}
        echo "✅ Created directory structure:"
        echo "   public/images/articles/     - Article-specific images"
        echo "   public/images/hero/         - Hero section images"
        echo "   public/images/sections/     - Section background images"
        echo "   public/images/thumbnails/   - Article thumbnails"
        ;;
    "help"|*)
        echo "Usage: $0 <command> [options]"
        echo ""
        echo "Commands:"
        echo "  single <input> <output_dir> [quality]  - Convert single image"
        echo "  batch <input_dir> <output_dir> [quality] - Convert all images in directory"
        echo "  setup                                    - Create image directories"
        echo "  help                                     - Show this help"
        echo ""
        echo "Examples:"
        echo "  $0 setup"
        echo "  $0 single photo.jpg public/images/articles/watermelon/ 85"
        echo "  $0 batch ~/Photos public/images/articles/watermelon/ 85"
        echo ""
        echo "Quality settings:"
        echo "  75-80%  - Good for thumbnails (smaller files)"
        echo "  85%     - Excellent for web (recommended)"
        echo "  90-95%  - High quality (larger files)"
        ;;
esac
