# asciidoctor-convert-action

## Description

This Action converts adoc files into PDF and ePUB files.

## Usage

```yaml
name: Press books
uses: enjikaka/asciidoctor-convert-action@v0.12
with:
  inputPath: books
  outputDir: build
```

In this case this action will build the html files like docs but the documents in the `slides` directory like slides. 
The other options define the input and the output directory. Where are the `.adoc` files placed and where are the files compiled to.

### Parameters

|              | inputPath | outputDir  | generatePdf    | generateEpub    |
|--------------|-----------|------------|----------------|----------------|
| isOptional   | true      | true       | true           | true           |
| defaultValue | null      | null       | true           | true           |
| type         | string    | string     | boolean        | boolean        |
