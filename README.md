# asciidoctor-convert-action

## Description

This Action converts adoc files into PDF and ePUB files.

## Usage

## A folder with many books

```yaml
name: Press books
uses: enjikaka/asciidoctor-convert-action@v0.19
with:
  inputBooks: books
  outputDir: build
```

Will convert:

- `books/1337/index.adoc`
- `books/1338/index.adoc`

To:

- `build/1337.epub`
- `build/1337.pdf`
- `build/1338.epub`
- `build/1338.pdf`

## A single book

```yaml
name: Press books
uses: enjikaka/asciidoctor-convert-action@v0.12
with:
  inputBook: books/my-source.adoc
  outputName: "my-final-book"
  outputDir: build
```

Will convert `books/my-source.adoc` to `build/my-final-book.pdf` and `build/my-final-book.epub`.
