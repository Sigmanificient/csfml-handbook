#!/usr/bin/env python3

from datetime import date

extensions = [
    "myst_parser",
    "sphinx.ext.intersphinx",
    "sphinx.ext.todo",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinx_sitemap",
    "notfound.extension",

    'sphinx.ext.autodoc',
    'sphinx.ext.autosectionlabel',
    'sphinx.ext.coverage',
    'sphinx.ext.mathjax',
    'sphinx.ext.ifconfig',
    'sphinx.ext.viewcode',
    'sphinx.ext.inheritance_diagram',
    'breathe'
]

myst_enable_extensions = [
    "attrs_inline",
    "colon_fence",
    "linkify",
    "tasklist",
]

myst_heading_anchors = 3
myst_number_code_blocks = [ "c" ]
highlight_language = 'c'

templates_path = [ ]
exclude_patterns = [ ".git", ".direnv", "csfml" ]

source_suffix = ".md"
master_doc = "index"

project = "CSFML-handbook"
author = "Sigmanificient"
copyright = f"2024 - {date.today().year}, Sigmanificient"

pygments_style = "sphinx"
todo_include_todos = True

html_baseurl = "https://notes.1l.is"
html_theme = "furo"
html_favicon = "favicon.png"
html_logo = "logo_small.png"
html_title = project.replace('-', ' ')

html_theme_options = {
    "sidebar_hide_name": True,
    "light_css_variables": {
        "color-brand-primary": "#537D1C",
        "color-brand-content": "#496F19",
    },
    "dark_css_variables": {
        "color-brand-primary": "#71AC27",
        "color-brand-content": "#68A716",
    },
}

html_static_path = [ "_static" ]
html_css_files = [ "custom.css" ]
html_extra_path = []

sitemap_url_scheme = "{link}"

# Not found
notfound_urls_prefix = "/"

breathe_projects = { "CSFML": ".build/csfml/xml/" }
breathe_default_project = "CSFML"
breathe_default_members = ('members', 'undoc-members')
breathe_domain_by_extension = { 'h': 'c', 'c': 'c' }
