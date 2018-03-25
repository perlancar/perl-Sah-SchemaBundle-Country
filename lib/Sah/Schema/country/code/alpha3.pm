package Sah::Schema::country::code::alpha3;

# DATE
# VERSION

use Locale::Codes::Country_Codes ();

my $codes = [sort (
    keys(%{ $Locale::Codes::Data{'country'}{'code2id'}{'alpha-3'} }),
)];
die "Can't extract country codes from Locale::Codes::Country_Codes"
    unless @$codes;

our $schema = [str => {
    summary => 'Country code (alpha-3)',
    description => <<'_',

Accept only current (not retired) codes. Only alpha-3 codes are accepted.

_
    match => '\A[a-z]{3}\z',
    in => $codes,
    'x.perl.coerce_rules' => ['str_tolower'],
}, {}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::country::code::alpha2>

L<Sah::Schema::country::code>
