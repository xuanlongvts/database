INSERT INTO links
    (url, name)
VALUES
    ('https://www.google.com', 'Google'),
    ('https://www.yahoo.com', 'Yahoo'),
    ('https://www.bing.com', 'Bing');

INSERT INTO links
    (url, name, description)
VALUES
    ('https://duckduckgo.com/', 'DuckDuckGo', 'Privacy & Simplified Search Engine'),
    ('https://swisscows.com/', 'Swisscows', 'Privacy safe WEB-search')
RETURNING *