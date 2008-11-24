## Summarize

This extension allows you to truncate part of a page's content.

## Usage

Ex: Works in any page part.

    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
    
    <r:more />
    
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    
All content after the `<r:more />` tag gets truncated (non-destructively). Output from the `<r:more />` tag is disabled when viewing a page by itself (or not within another page).

### Notes on the modded `<r:content />` tag

* It has been modified to truncate automatically when the `<r:more />` tag is present.
* `<r:content />` tag is a duplication of the original tag found radiant core source code

### Other features

You can force the `<r:content />` tag to display full content

    <r:content summary="false" />

Since the `<r:more />` tag outputs a link by default, you can opt to change the link text on a per page basis.

    <r:more link="Read more ..." />

You can also disable the link altogether

    <r:more disable_link="true" />
    

### Todo

* Set link text globally from radiant config hashs
* Customizable CSS and CSS class names for html output.
* [FUTURE] Merge into the blog extension