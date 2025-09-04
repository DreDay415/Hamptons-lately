# 🖼️ **Unsplash to WebP Workflow Guide**

## **🚀 Complete Workflow: Unsplash → WebP → Your Articles**

### **Step 1: Download Images from Unsplash**

1. **Go to [Unsplash.com](https://unsplash.com)**
2. **Search for relevant images** (see recommendations below)
3. **Download 3-4 high-quality images** to: `~/Downloads/hamptons-images/`
4. **Use JPG format** for best compatibility

### **Step 2: Process Images with Our Script**

```bash
# Process images for a specific article
./unsplash-workflow.sh process 85-dollar-watermelon 85

# The script will:
# ✅ Convert all images to WebP (85% quality)
# ✅ Organize them by type (hero, content-1, content-2, thumbnail)
# ✅ Place them in the correct article directory
# ✅ Show file size savings
```

### **Step 3: Update Your Article Component**

```astro
---
// In your article file (e.g., 85-dollar-watermelon-citarella.astro)
import ArticleHero from '../../components/ArticleHero.astro';
import OptimizedImage from '../../components/OptimizedImage.astro';
---

<ArticleHero
  src="/images/articles/85-dollar-watermelon/hero.webp"
  alt="Expensive watermelon displayed at Citarella market"
  title="85 Dollar Watermelon Declared Local Emergency"
  subtitle="Local grocery store defends pricing strategy as 'premium experience'"
  credit="Photo from Unsplash"
/>

<!-- Content images -->
<OptimizedImage
  src="/images/articles/85-dollar-watermelon/content-1.webp"
  alt="Luxury grocery store interior with premium products"
  width="800"
  height="600"
  class="article-image"
/>
```

### **Step 4: Clean Up**

```bash
# Remove downloaded images after processing
./unsplash-workflow.sh cleanup
```

## **📋 Unsplash Search Recommendations**

### **85 Dollar Watermelon**
- `expensive fruit luxury market`
- `watermelon grocery store premium`
- `luxury food shopping`
- `high-end grocery store`

### **Weekend Spotlight**
- `hamptons weekend luxury`
- `east hampton beach house`
- `sag harbor weekend`
- `hamptons lifestyle`

### **Beach Access**
- `private beach access`
- `beach gate entrance`
- `exclusive beach property`
- `beach house entrance`

### **Infinity Pool**
- `infinity pool luxury`
- `hamptons pool house`
- `swimming pool construction`
- `luxury pool design`

### **Local Man Survives**
- `man without phone`
- `digital detox summer`
- `person reading book`
- `unplugged lifestyle`

### **General Hamptons Content**
- `hamptons luxury lifestyle`
- `east hampton summer`
- `sag harbor village`
- `hamptons real estate`
- `luxury beach house`

## **🎯 Image Requirements**

### **Resolution**
- **Minimum:** 1200x800px
- **Recommended:** 1920x1080px or larger
- **Format:** JPG (for best compatibility)

### **Quantity per Article**
- **Hero image:** 1 (main article image)
- **Content images:** 2-3 (for article body)
- **Thumbnail:** 1 (for article cards)

### **Quality Settings**
- **85% WebP quality** (recommended)
- **75-80%** for thumbnails (smaller files)
- **90-95%** for hero images (higher quality)

## **📁 File Organization**

After processing, your images will be organized like this:

```
public/images/articles/85-dollar-watermelon/
├── hero.webp          # Main article image
├── content-1.webp     # First content image
├── content-2.webp     # Second content image
└── thumbnail.webp     # Article thumbnail
```

## **⚡ Performance Benefits**

- **25-35% smaller files** than JPG
- **Faster loading** on all devices
- **Better SEO** with optimized images
- **Automatic fallbacks** for older browsers
- **Lazy loading** for better performance

## **🔧 Script Commands**

```bash
# Show available articles
./unsplash-workflow.sh articles

# Process images for an article
./unsplash-workflow.sh process <article-name> [quality]

# Clean up download directory
./unsplash-workflow.sh cleanup

# Show usage examples
./unsplash-workflow.sh examples

# Show help
./unsplash-workflow.sh help
```

## **💡 Pro Tips**

1. **Download high-resolution images** - you can always resize down
2. **Use descriptive search terms** - better results
3. **Get 3-4 images per article** - variety is good
4. **Test on mobile** - ensure images look good on all devices
5. **Use proper alt text** - important for SEO and accessibility
6. **Clean up regularly** - keep your download folder organized

## **🚨 Troubleshooting**

### **No images found**
- Check that images are in `~/Downloads/hamptons-images/`
- Ensure images are JPG, JPEG, or PNG format
- Run `./unsplash-workflow.sh articles` to see available articles

### **Conversion fails**
- Check that ImageMagick is installed: `brew install imagemagick`
- Verify image files aren't corrupted
- Try with a different quality setting (75-95)

### **Images not showing**
- Check file paths in your article components
- Ensure images are in the correct directory
- Run `npm run build` to test locally

## **🎉 Success Checklist**

- [ ] Downloaded images from Unsplash
- [ ] Processed images with the script
- [ ] Updated article components
- [ ] Tested locally with `npm run build`
- [ ] Cleaned up download directory
- [ ] Deployed to Vercel
- [ ] Verified images load correctly

Your Hamptons Lately site will now have beautiful, fast-loading images that enhance the user experience and improve SEO! 🚀
