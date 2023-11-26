(lang dune 3.11)

(name zen_flow)

(generate_opam_files true)

(source
 (github b0a04gl/zen-flow))

(authors "balaji")

(maintainers "b0a04gl")

(license MIT)

(documentation https://url/to/documentation)

(package
 (name zen_flow)
 (synopsis "Lazy eval for transforming ADTs")
 (description "A library to lazily perform transformations for 3 critical enum operations [take, filter, map] on ADTs")
 (depends ocaml dune ounit2)
 (tags
  (topics "lazy eval" zen_flow)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
