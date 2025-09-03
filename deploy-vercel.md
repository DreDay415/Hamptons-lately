# 🚀 Deploy to Vercel - Quick Guide

## Prerequisites
- GitHub account
- Vercel account (free at [vercel.com](https://vercel.com))

## Step 1: Push to GitHub

```bash
# Add your GitHub remote (replace YOUR_USERNAME with your actual GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/hamptons-lately.git

# Push to GitHub
git push -u origin main
```

## Step 2: Deploy on Vercel

1. **Go to [vercel.com](https://vercel.com)** and sign in
2. **Click "New Project"**
3. **Import your GitHub repository**:
   - Select "Import Git Repository"
   - Choose your `hamptons-lately` repository
   - Click "Import"

4. **Configure your project**:
   - **Framework Preset**: `Astro`
   - **Root Directory**: `./` (leave as default)
   - **Build Command**: `npm run build` (should auto-detect)
   - **Output Directory**: `dist` (should auto-detect)
   - **Install Command**: `npm install` (should auto-detect)

5. **Click "Deploy"**

## Step 3: Custom Domain (Optional)

1. **In your Vercel project dashboard**, go to "Settings" → "Domains"
2. **Add your custom domain** (e.g., `hamptonslately.com`)
3. **Update your DNS records** as instructed by Vercel
4. **Wait for SSL certificate** (automatic, takes a few minutes)

## Step 4: Automatic Deployments

- **Every time you push to `main`**, Vercel will automatically rebuild and deploy
- **Preview deployments** are created for pull requests
- **Rollback** to previous versions anytime

## 🎯 Your Site Will Be Live At:

- **Vercel URL**: `https://your-project-name.vercel.app`
- **Custom Domain**: `https://yourdomain.com` (if you set one up)

## 🔄 Updating Your Site

```bash
# Make changes to your code
# Then push to GitHub
git add .
git commit -m "Update content"
git push origin main

# Vercel automatically deploys! 🎉
```

## 🆘 Troubleshooting

### Build Fails
- Check the build logs in Vercel dashboard
- Ensure all dependencies are in `package.json`
- Verify the build command is correct

### Images Not Loading
- Check that image URLs are accessible
- Use relative paths when possible
- Ensure images are in the `public/` folder

### 404 Errors
- Verify your routing structure
- Check that all pages are in the correct folders
- Ensure the build output is correct

## 🎉 You're Done!

Your Hamptons Lately website will be live on the internet, automatically updating every time you push changes to GitHub!

---

**Need help?** Check the [Vercel documentation](https://vercel.com/docs) or [Astro docs](https://docs.astro.build).
