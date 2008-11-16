# Summarize

When using Radiant as a blog, I found the need to have a summary page part for every post as there wasn't any way to truncate content out of the box. So I built the Summarize extension. It's pretty simple.

## Usage

Let's say you have a blog with a list of posts. Some blogs like to summarize or use an exceprt as a teaser for each post in the list. For me that has always been the first single or couple of paragraphs at the top of my post.

Simply add a single `<r:more />` tag after the first or so paragraphs in your post and this extension will truncate the rest. If you leave it out, the content tag will render as usual. The `<r:more />` tags simply inserts html code: `<div><!--more--></div>`. Where this code is located, this extension will simply split the post and remove everything after it (non-destructively).

Ex:

    Hey there this is a post that I want to truncate, right about, NOW!

    <r:more />

    This is the rest of my post. Hopefully you enjoyed the summary

But what about when you want to display ALL the content. Well, you simply disable it.

Ex:

    <r:content summary="false" />

Your content will then display in all it's fullness.

CONTRIBUTORS: If you want to help improve this extension, please fork, hack it, commit/push and send a pull request. (I'm a ruby newb, so don't mind the ugliness.)