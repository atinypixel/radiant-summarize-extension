# Summarize

When using Radiant as a blog, I found the need to have a summary page part for every post as there wasn't any way to truncate content out of the box. So I built the Summarize extension. It's pretty simple.

## Usage

Let's say you have a blog with a list of posts. Some blogs like to summarize or use an exceprt as a teaser for each post in the list. For me that has always been the first single or couple of paragraphs at the top of my post.

Simply add a single `<r:more />` tag after the first or so paragraphs in your post and this extension will truncate the rest. If you leave it out, the content tag will render as usual. The `<r:more />` tags simply inserts html code: `<div><!--more--></div>`. Where this code is located, this extension will simply split the post and remove everything after it (non-destructively).

Ex: (in your page part)

    Hey there this is a post that I want to truncate, right about, NOW!

    <r:more />

    This is the rest of my post. Hopefully you enjoyed the summary

Additionally, the `<r:more />` tag also outputs a link just above the truncation marker that takes you to the individual page. You also have the option of modifying the default link text or disabling the link altogether.

Ex:
    # "Continue reading" by default
    <r:more link="Read more"/>
    
    # Disable the link
    <r:more disable_link="true" />
    
When viewing a page indiviually, all the html output by the `<r:more />` tag will simply disappear revealing the page's content in it's entirety. Essentially the `<r:more />` only works when displaying lists of children. You may find this be a bug, but it's really a feature.

CONTRIBUTORS: If you want to help improve this extension, please fork, hack it, commit/push and send a pull request. (I'm a ruby newb, so don't mind the ugliness.)