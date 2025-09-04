# 🖼️ **Image Optimization Guide for Hamptons Lately**

## **Quick Start - WebP Conversion**

### **1. Install Image Conversion Tools**
```bash
# Install ImageMagick for WebP conversion
brew install imagemagick

# Or use cwebp directly (Google's WebP converter)
brew install webp
```

### **2. Convert Images to WebP**
```bash
# Convert single image
magick input.jpg -quality 85 output.webp

# Convert multiple images
for file in *.jpg; do
  magick "$file" -quality 85 "${file%.jpg}.webp"
done

# Batch convert with cwebp
for file in *.jpg; do
  cwebp -q 85 "$file" -o "${file%.jpg}.webp"
done
```

## **📁 Recommended Directory Structure**

```
public/images/
├── articles/                    # Article-specific images
│   ├── 85-dollar-watermelon/
│   │   ├── hero.webp          # 1200x800px, 85% quality
│   │   ├── content-1.webp     # 800x600px, 85% quality
│   │   └── thumbnail.webp     # 400x300px, 85% quality
│   ├── weekend-spotlight/
│   │   ├── hero.webp
│   │   └── thumbnail.webp
│   └── ...
├── hero/                       # Main page hero images
│   ├── main-hero.webp         # 1920x1080px, 85% quality
│   └── mobile-hero.webp       # 800x600px, 85% quality
├── sections/                   # Section background images
│   ├── weather-bg.webp        # 1200x400px, 85% quality
│   └── weekend-bg.webp        # 1200x400px, 85% quality
└── thumbnails/                 # Article thumbnails
    ├── watermelon-thumb.webp   # 400x300px, 85% quality
    └── weekend-thumb.webp      # 400x300px, 85% quality
```

## **🎯 Optimal Image Sizes & Quality**

### **Hero Images**
- **Desktop:** 1920x1080px (16:9 ratio)
- **Mobile:** 800x600px (4:3 ratio)
- **Quality:** 85% WebP
- **File size target:** < 200KB

### **Article Images**
- **Hero:** 1200x800px (3:2 ratio)
- **Content:** 800x600px (4:3 ratio)
- **Thumbnail:** 400x300px (4:3 ratio)
- **Quality:** 85% WebP
- **File size target:** < 150KB

### **Section Backgrounds**
- **Width:** 1200px
- **Height:** 400-600px
- **Quality:** 85% WebP
- **File size target:** < 100KB

## **⚡ Performance Best Practices**

### **1. Use WebP with Fallbacks**
```html
<picture>
  <source srcset="/images/article.webp" type="image/webp">
  <img src="/images/article.jpg" alt="Description" loading="lazy">
</picture>
```

### **2. Lazy Loading**
```html
<img src="/images/article.webp" alt="Description" loading="lazy">
```

### **3. Responsive Images**
```html
<picture>
  <source media="(min-width: 768px)" srcset="/images/desktop.webp">
  <source media="(max-width: 767px)" srcset="/images/mobile.webp">
  <img src="/images/fallback.jpg" alt="Description">
</picture>
```

## **🔧 Astro-Specific Implementation**

### **1. Create Image Components**
```astro
---
// src/components/OptimizedImage.astro
interface Props {
  src: string;
  alt: string;
  width?: number;
  height?: number;
  class?: string;
  lazy?: boolean;
}

const { src, alt, width, height, class: className, lazy = true } = Astro.props;
---

<picture>
  <source srcset={src.replace('.jpg', '.webp')} type="image/webp">
  <img 
    src={src} 
    alt={alt}
    width={width}
    height={height}
    class={className}
    loading={lazy ? 'lazy' : 'eager'}
  >
</picture>
```

### **2. Use in Articles**
```astro
---
// In your article files
import OptimizedImage from '../../components/OptimizedImage.astro';
---

<OptimizedImage
  src="/images/articles/85-dollar-watermelon/hero.webp"
  alt="Expensive watermelon at Citarella"
  width="1200"
  height="800"
  class="article-hero"
/>
```

## **📱 Mobile-First Image Strategy**

### **1. Progressive Enhancement**
- Start with optimized mobile images
- Enhance with larger images for desktop
- Use `srcset` for different screen densities

### **2. Critical Images**
- Hero images: `loading="eager"` (above the fold)
- Content images: `loading="lazy"` (below the fold)
- Thumbnails: Always lazy load

## **🚀 Advanced Optimization**

### **1. Multiple WebP Qualities**
```bash
# Generate multiple quality versions
magick input.jpg -quality 90 high.webp
magick input.jpg -quality 85 medium.webp
magick input.jpg -quality 75 low.webp
```

### **2. Use srcset for Different Qualities**
```html
<source 
  srcset="
    /images/high.webp 1x,
    /images/medium.webp 2x
  " 
  type="image/webp"
>
```

## **📊 File Size Targets**

| Image Type | Target Size | Quality | Format |
|------------|-------------|---------|---------|
| Hero (Desktop) | < 200KB | 85% | WebP |
| Hero (Mobile) | < 100KB | 85% | WebP |
| Article Content | < 150KB | 85% | WebP |
| Thumbnails | < 50KB | 85% | WebP |
| Section BGs | < 100KB | 85% | WebP |

## **🔄 Workflow Summary**

1. **Prepare images** in high quality (JPG/PNG)
2. **Convert to WebP** using ImageMagick or cwebp
3. **Optimize quality** (85% is usually perfect)
4. **Organize in directories** by purpose
5. **Implement with fallbacks** for older browsers
6. **Test performance** with Lighthouse
7. **Monitor Core Web Vitals**

## **💡 Pro Tips**

- **Use WebP for everything** - it's 25-35% smaller than JPG
- **85% quality** is the sweet spot for web images
- **Always provide fallbacks** for older browsers
- **Lazy load everything** below the fold
- **Test on slow connections** to ensure good UX
- **Use descriptive alt text** for SEO and accessibility
