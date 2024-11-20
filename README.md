# ANZAC Neurogenetics Gadi guide 

## Contributing to this repository

1. **Do not** under any circumstances commit to the main branch without review by someone else;
2. Fork the repository, make and test changes, then put in a pull request
3. If you are not sure how to do something, ask for help.

## File location

- Store `index.qmd`, `setup.qmd` files in the root directory
- Store markdown lessons (.qmd or .md) in the `notebooks` folder
- Store figures in a `figs` folder

## How to contribute to the guide

You can choose to work either locally or on your Nimbus VM to make changes to this guide. Please work in VS code to easily edit the markdown files. No changes are to be made to the html files directly. 

Grab a copy of the repository by cloning it to your local machine or Nimbus VM: 

```bash
git clone https://github.com/Sydney-Informatics-Hub/ANZAC_neurogenetics_Gadi_guide.git
```

1. Edit `index.qmd` to change the main landing page. This is a markdown file.
2. Edit or create `setup.qmd` to change the Setup instruction pages. Same - basically a md file.
3. Edit `_quarto.yml` to reorder/rename/remove/replace the dropdown menu options.
4. Add additional `*.qmd` files to the root dir to have them converted to html files (and add them to `_quarto.yml` to make them navigable), if you'd like.
5. Add any figures to `figs/` and give them a descriptive name. 

You can browse the result locally by exploring the html files created (note: sometimes figures display locally but not on web and the other way around too) by running: 

```bash
quarto preview
```

Once you've made changes to the materials, run the following on the commandline: 

```bash
quarto render
# First time you create the file, add them to be tracked by github, e.g.
git add docs/*
git commit -am "your comments"
git push origin main 
```

This repository has been set up to auto publish updates using a github action in `.github/workflows/quarto_render_publish.yml`. Once you push changes to main, you should see the updates on the [website](https://sydney-informatics-hub.github.io/ANZAC_neurogenetics_Gadi_guide/) within a couple of minutes. 

### Themes, Aesthetic and Branding

If you'd like to use a more generic and possibly neutral theme, go to the `_quarto.yaml` and change the format section to:

```yaml
format:
  html:
   toc: true
   theme:
      light: flatly
      dark: darkly
   css: styles.scss
   code-link: true
   code-fold: false
```

If you'd like to change to the USYD Masterbrand Ochre, go to the `_quarto.yaml` and change the format section to:

```yaml
format:
  html:
    theme: simplex
    css: [lesson.css, bootstrap-icons.css]
    toc: true
    code-overflow: wrap
    highlight-style: github
```
