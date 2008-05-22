## $Id$

=head1 TITLE

Grammar - Perl 6 Grammar class

=head1 DESCRIPTION

This file implements the Grammar class.

=cut

.namespace [ 'Grammar' ]


=head1 SUBROUTINES

=over 4

=item onload()

=cut

.sub 'onload' :anon :init :load
    load_bytecode "PGE.pbc"
    .local pmc p6meta
    p6meta = get_hll_global ['Perl6Object'], '$!P6META'
    p6meta.'new_class'('Grammar', 'parent'=>'PGE::Grammar')
.end


=item ACCEPTS(topic)

Invokes the TOP rule in the grammar on the given topic.

=cut

.sub 'ACCEPTS' :method
    .param pmc topic
    .local pmc TOP

    # If there's a TOP rule, invoke it.
    push_eh no_TOP
    TOP = find_method self, "TOP"
    pop_eh
    .local pmc match
    $S0 = self.'WHAT'()
    match = TOP(topic, 'grammar' => $S0)
    $P0 = getinterp
    $P1 = $P0['lexpad';1]
    unless null $P1 goto found_pad
    $P1 = $P0['lexpad';2]
found_pad:
    $P1['$/'] = match
    .return(match)

  no_TOP:
    'die'("The grammar has no TOP rule to invoke.")
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
