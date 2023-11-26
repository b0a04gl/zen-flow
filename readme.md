# zen-flow

This is an OCaml library to provide lazy stream implementation with common stream operations [map, filter, take].

## Installation

To use this library in your project, add the following to your `dune` file:

```dune
(library
 (name lazy_stream)
 (modules lazy_stream)
)
```

## Usage

```ocaml
open Lazy_stream

let my_stream = from_list [1; 2; 3; 4; 5]
let doubled_stream = map (( * ) 2) my_stream
let filtered_stream = filter (fun x -> x mod 2 = 0) doubled_stream
let result = take 3 filtered_stream
```

## Documentation

For detailed documentation on the functions provided, refer to the [`lazy_stream.mli`](lib/lazy_stream.mli) file.

## Testing

This project includes a test suite. To run the tests, use the following command:

```bash
dune runtest
```
