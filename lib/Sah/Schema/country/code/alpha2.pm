package Sah::Schema::country::code::alpha2;

use strict;
use Locale::Codes::Country_Codes ();

# AUTHORITY
# DATE
# DIST
# VERSION

my $codes = [];
my $names = [];
{
    for my $alpha2 (keys(%{ $Locale::Codes::Data{'country'}{'code2id'}{'alpha-2'} })) {
        push @$codes, $alpha2;
        my $id = $Locale::Codes::Data{'country'}{'code2id'}{'alpha-2'}{$alpha2}[0];
        push @$names, $Locale::Codes::Data{'country'}{'id2names'}{$id}[0];
    }

    die "Can't extract country codes from Locale::Codes::Country_Codes"
        unless @$codes;
}

our $schema = [str => {
    summary => 'Country code (alpha-2)',
    description => <<'_',

Accept only current (not retired) codes. Only alpha-2 codes are accepted.

Code will be converted to lowercase.

_
    match => '\A[a-z]{2}\z',
    in => $codes,
    'x.in.summaries' => $names,
    'x.perl.coerce_rules' => ['From_str::to_lower'],
    examples => [
        {value=>'', valid=>0},
        {value=>'ID' , valid=>1, validated_value=>'id'},
        {value=>'IDN', valid=>0, summary=>'Only alpha-2 codes are allowed'},
        {value=>'xx', valid=>0},
        {value=>'xxx', valid=>0},
    ],
}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::country::code::alpha3>

L<Sah::Schema::country::code>
