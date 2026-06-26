type annotation =
  Atom of string
| Fun of string * annotation list
| List of annotation list
| Colon of annotation * annotation

