
var readable_options = {
    text_font: 'quote(Palatino%20Linotype),'+
        '%20Palatino,%20quote(Book%20Antigua),'+
        '%20Georgia,%20serif',
    text_font_monospace: 'quote(Courier%20New),'+
        '%20Courier,%20monospace',
    text_font_header: 'quote(Times%20New%20Roman),'+
        '%20Times,%20serif',
    text_size: '18px',
    text_line_height: '1.5',
    box_width: '30em',
    color_text: '#282828',
    color_background: '#F5F5F5',
    color_links: '#0000FF',
    text_align: 'normal',
    base: 'blueprint',
    custom_css: ''
};

interactive("readable",
            "Based on the readable bookmarklet.",
            function (I) {
                var document = I.buffer.document;
                var window = document.defaultView.wrappedJSObject;
                if (document.getElementsByTagName('body').length == 0)
                    return;
                if (window.$readable) {
                    if (window.$readable.bookmarkletTimer)
                        return;
                } else
                    window.$readable = {};
                window.$readable.bookmarkletTimer = true;
                window.$readable.options = readable_options;
                if (window.$readable.bookmarkletClicked) {
                    window.$readable.bookmarkletClicked();
                    return;
                }
                var el = document.createElement('script');
                el.setAttribute('src',
                                'http://readable-static.tastefulwords.com/target.js'+
                                '?rand='+encodeURIComponent(Math.random()));
                document.getElementsByTagName('body')[0].appendChild(el);
            });
