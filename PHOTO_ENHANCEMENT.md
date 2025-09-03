# 📸 Photo Enhancement & Color Guide

## 🎨 **Quick Photo Improvements**

### **Option 1: Enhanced Unsplash URLs**
Add these parameters to your Unsplash URLs for better photos:

```bash
# Original URL
https://images.unsplash.com/photo-1578662996442-48f60103fc96

# Enhanced with filters
https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=600&fit=crop&sat=50&contrast=25&brightness=10
```

**Filter Parameters:**
- `&sat=50` - Reduce saturation (more professional look)
- `&contrast=25` - Increase contrast
- `&brightness=10` - Slightly brighter
- `&blur=100` - Add subtle blur effect
- `&fit=crop` - Smart cropping

### **Option 2: Use Your Own Photos**
1. **Upload photos** to the `public/images/` folder
2. **Reference them locally**: `/images/your-photo.jpg`
3. **Better quality control** and no external dependencies

### **Option 3: Professional Photo Services**
- **Shutterstock** - High-quality stock photos
- **Adobe Stock** - Professional images
- **Getty Images** - Premium content

## 🎨 **Color Scheme Switcher**

### **Current Theme: Ocean & Sand**
```css
--primary-color: #2c3e50;      /* Deep Blue */
--secondary-color: #34495e;     /* Navy */
--accent-color: #3498db;        /* Ocean Blue */
```

### **Switch to Beach & Sunset**
1. Open `src/styles/colors.css`
2. Comment out the current theme
3. Uncomment the Beach & Sunset theme
4. Rebuild and deploy

### **Switch to Luxury Gold & Navy**
1. Open `src/styles/colors.css`
2. Comment out the current theme
3. Uncomment the Luxury Gold theme
4. Rebuild and deploy

## 🖼️ **Recommended Photo Sizes**

### **Hero Images**
- **Width**: 1200px
- **Height**: 400px
- **Format**: WebP or JPEG
- **Quality**: 80-90%

### **Article Images**
- **Width**: 800px
- **Height**: 600px
- **Format**: WebP or JPEG
- **Quality**: 80-90%

### **Thumbnail Images**
- **Width**: 400px
- **Height**: 300px
- **Format**: WebP or JPEG
- **Quality**: 70-80%

## 🌅 **Hamptons Photo Ideas**

### **Beach & Ocean**
- Georgica Beach at sunset
- Montauk Lighthouse
- Ocean waves crashing
- Beach umbrellas and chairs

### **Luxury & Lifestyle**
- Mansions and estates
- Luxury cars (Range Rovers, Teslas)
- Yachts and boats
- High-end restaurants

### **Local Charm**
- Main Street shops
- Historic buildings
- Local farmers markets
- Scenic country roads

## 🔧 **Quick Photo Fixes**

### **Too Dark?**
Add `&brightness=20` to Unsplash URL

### **Too Saturated?**
Add `&sat=30` to Unsplash URL

### **Need More Contrast?**
Add `&contrast=30` to Unsplash URL

### **Want Vintage Look?**
Add `&blur=50&sat=40` to Unsplash URL

## 📱 **Mobile Optimization**

### **Responsive Images**
```html
<img src="photo-small.jpg" 
     srcset="photo-small.jpg 400w, 
             photo-medium.jpg 800w, 
             photo-large.jpg 1200w"
     sizes="(max-width: 600px) 400px, 
            (max-width: 1200px) 800px, 
            1200px"
     alt="Description">
```

### **Lazy Loading**
```html
<img src="photo.jpg" loading="lazy" alt="Description">
```

## 🚀 **Next Steps**

1. **Choose your color scheme** from `src/styles/colors.css`
2. **Enhance your photos** with Unsplash filters
3. **Upload custom photos** to `public/images/`
4. **Test on mobile** devices
5. **Deploy updates** to Vercel

---

**Pro Tip**: Use the same color scheme across all your photos for a cohesive, professional look! 🎨✨
