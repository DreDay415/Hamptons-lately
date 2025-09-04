# 📝 **Example: Adding Images to Your Articles**

## **Step 1: Prepare Your Images**

Convert your images to WebP format and place them in the correct directories:

```bash
# Convert your article images
magick your-article-image.jpg -quality 85 public/images/articles/85-dollar-watermelon/hero.webp
magick your-article-image.jpg -quality 85 public/images/articles/85-dollar-watermelon/thumbnail.webp
```

## **Step 2: Update Your Article Component**

Here's how to modify your existing article to include the hero image:

```astro
---
// src/pages/articles/85-dollar-watermelon-citarella.astro
import Layout from '../../layouts/Layout.astro';
import ArticleHero from '../../components/ArticleHero.astro';
import OptimizedImage from '../../components/OptimizedImage.astro';

const title = "85 Dollar Watermelon Declared Local Emergency";
const description = "Citarella's latest price gouging scandal leaves locals in shock...";
---

<Layout title={title} description={description}>
  <article class="article">
    <!-- Hero Image Section -->
    <ArticleHero
      src="/images/articles/85-dollar-watermelon/hero.webp"
      alt="Expensive watermelon displayed at Citarella market with luxury price tag"
      title={title}
      subtitle="Local grocery store defends pricing strategy as 'premium experience'"
      credit="Photo by Local Shopper"
    />

    <!-- Article Content -->
    <div class="article-content">
      <p>In a move that has left the Hamptons community both amused and appalled, 
      Citarella has introduced what they're calling a "premium watermelon experience" 
      with a price tag that could feed a family of four for a week.</p>

      <!-- Content Image Example -->
      <div class="content-image">
        <OptimizedImage
          src="/images/articles/85-dollar-watermelon/content-1.webp"
          alt="Watermelon display with luxury branding and premium packaging"
          width="800"
          height="600"
          class="article-image"
          sizes="(max-width: 768px) 100vw, 800px"
        />
        <p class="image-caption">The $85 watermelon comes with premium packaging and a certificate of authenticity</p>
      </div>

      <p>"This isn't just any watermelon," explained store manager Marcus Luxury, 
      "This is a watermelon that has been personally selected by our master fruit 
      curator, aged to perfection, and comes with a certificate of authenticity."</p>
    </div>
  </article>
</Layout>

<style>
  .article {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem 1rem;
  }

  .article-content {
    font-size: 1.1rem;
    line-height: 1.7;
    color: #333;
  }

  .content-image {
    margin: 2rem 0;
    text-align: center;
  }

  .article-image {
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 1rem;
  }

  .image-caption {
    font-size: 0.9rem;
    color: #666;
    font-style: italic;
    margin: 0;
  }
</style>
```

## **Step 3: Add Thumbnail to Article Cards**

Update your ArticleCard component to include thumbnails:

```astro
---
// src/components/ArticleCard.astro
import OptimizedImage from './OptimizedImage.astro';

interface Props {
  title: string;
  description: string;
  slug: string;
  thumbnail?: string;
  date?: string;
}

const { title, description, slug, thumbnail, date } = Astro.props;
---

<article class="article-card">
  {thumbnail && (
    <div class="card-image">
      <OptimizedImage
        src={thumbnail}
        alt={`${title} - Article thumbnail`}
        width="400"
        height="300"
        class="card-thumbnail"
        sizes="(max-width: 768px) 100vw, 400px"
      />
    </div>
  )}
  
  <div class="card-content">
    <h3 class="card-title">
      <a href={`/articles/${slug}/`}>{title}</a>
    </h3>
    <p class="card-description">{description}</p>
    {date && <time class="card-date">{date}</time>}
  </div>
</article>

<style>
  .article-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .article-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 25px rgba(0, 0, 0, 0.15);
  }

  .card-image {
    width: 100%;
    height: 200px;
    overflow: hidden;
  }

  .card-thumbnail {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
  }

  .article-card:hover .card-thumbnail {
    transform: scale(1.05);
  }

  .card-content {
    padding: 1.5rem;
  }

  .card-title {
    margin: 0 0 0.5rem 0;
    font-size: 1.25rem;
    font-weight: 600;
    color: #2e7061;
  }

  .card-title a {
    color: inherit;
    text-decoration: none;
  }

  .card-title a:hover {
    color: #225744;
  }

  .card-description {
    margin: 0 0 1rem 0;
    color: #666;
    line-height: 1.5;
  }

  .card-date {
    font-size: 0.9rem;
    color: #999;
  }
</style>
```

## **Step 4: Use Article Cards with Thumbnails**

```astro
---
// In your index.astro or article listing page
import ArticleCard from '../components/ArticleCard.astro';

const articles = [
  {
    title: "85 Dollar Watermelon Declared Local Emergency",
    description: "Citarella's latest price gouging scandal leaves locals in shock...",
    slug: "85-dollar-watermelon-citarella",
    thumbnail: "/images/articles/85-dollar-watermelon/thumbnail.webp",
    date: "September 3, 2025"
  },
  // ... more articles
];
---

<div class="articles-grid">
  {articles.map(article => (
    <ArticleCard {...article} />
  ))}
</div>
```

## **Step 5: Test Your Images**

1. **Build locally:** `npm run build`
2. **Check the dist folder** to ensure images are copied
3. **Test performance** with Lighthouse
4. **Verify WebP fallbacks** in older browsers

## **🎯 Key Benefits of This Approach**

- **WebP optimization** for 25-35% smaller file sizes
- **Automatic fallbacks** for older browsers
- **Lazy loading** for better performance
- **Responsive images** for all devices
- **SEO-friendly** with proper alt text
- **Accessibility** with proper image descriptions
- **Performance** with optimized loading strategies

## **📱 Mobile Optimization**

The components automatically handle:
- **Responsive sizing** for different screen sizes
- **Touch-friendly** interactions
- **Fast loading** on mobile networks
- **Proper scaling** for high-DPI displays
