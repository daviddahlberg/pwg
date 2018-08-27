PWG(1) - General Commands Manual

# NAME

**pwg** - password generator

# SYNOPSIS

**pwg**
\[**-A**&nbsp;*custom&nbsp;alphabet*]
\[**-a**&nbsp;*predefined&nbsp;alphabet*]
\[**-e**&nbsp;*entropy*]
\[**-l**&nbsp;*length*]
\[**-n**&nbsp;*number*]
\[**-v**]  
**pwg**
**-h**

# DESCRIPTION

**pwg**
generates passwords of a given strength from
*/dev/urandom*.

As opposed the other password generators, it is not required (but still
possible) to specify password length.
Instead,
**pwg**
takes an alphabet and the required bits of entropy.
The alphabeth is the set of symbols (i.e. letters or words),
from which the password is constructed.
The password length is automatically calculated from those values.

The following options are available:

**-A** *custom alphabet*

> Define your own alphabet to pick characters from.

**-G** *predefined alphabet*

> Generate a new password from
> *Predifined Alphabet*.

**-e** *bits of entropy*

> Define the required bits of entropy.
> The default is 100, which suits the most recent recommentations of BSI, NIST
> and NSA.

**-l** *length*

> The generated password length.
> It is more useful to specify the required password quality with
> **-e**
> instead.
> You can use
> **-vl**
> to calculate the quality of a given password generation scheme.
> Only one of the options
> **-e**
> and
> **-l**
> may be used.

**-n** *number*

> Define the number of passwords to be generated.

**-h**

> Display help.

**-v**

> Display verbose output.

> This does include the display of the selected alphabet,
> the cardinality of the alphabet, the selected required
> entropy and the calculated required password length.

## Predefined Alphabet

ascii

> Printable ASCII characters.

alnum

> Alphanumeric characters.

num

> Numerals.

bin

> Binary numbers.

hex

> Hexadecimal numbers.

base64\[url], base32\[hex], base16

> RFC 4648 (The Base16, Base32 and Base64 Data Encodings") alphabets.

simple

> Alphanumeric characters withouth easily confued ones,
> such asl I l and 1 or O and 0.

distword

> Distinguishable characters without word boundaries.
> This is the default setting.

iphone

> Characters which are reachable on an iPhone keyboard with a
> maximum of one modifier (Shift or NumLock).

dice

> Diceware wordlist.

eff

> EFF long wordlist.

eff\_short1

> EFF general short wordlist (four dice).

eff\_short2

> EFF short wordlist whith unique prefixes.

skey

> S/KEY wordlist.

pgp

> PGP biometric word list.

# FILES

*/dev/urandom*

> Used randomness source.

# EXIT STATUS

The **pwg** utility exits&#160;0 on success, and&#160;&gt;0 if an error occurs.

# EXAMPLES

Generate a password:

	$ pwg

Generate password with 128 bits of entropy from the custom charset '01':

	$ pwg -e 128 -A '01'

# SEE ALSO

random(4)

# STANDARDS

Vint Cerf,
*ASCII format for Network Interchange*,
RFC 20,
16 October 1969.

S. Josefsson,
*The Base16, Base32, and Base64 Data Encodings*,
RFC 4648,
October 2006.

N. Haller,
*The S/KEY One-timePassword System*,
RFC 1760,
February 1995.

# HISTORY

The
**pwg**
utility has been published in 2018.

# AUTHORS

David Dahlberg &lt;[dyn+code@dahlberg.cologne](mailto:dyn+code@dahlberg.cologne)&gt;

OpenBSD 6.4 - May 7, 2018
